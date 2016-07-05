class DecisionsController < ApplicationController
  respond_to :html, :json

  before_filter :load_participant, only: [:edit, :update]

  def new
    @decision = Decision.new
    @decision.build_admin
  end

  def create
    @decision = Decision.new(decision_params)
    @decision.subscribe(self)
    @decision.subscribe(Postman.instance)

    respond_to do |format|
      if @decision.save
        prepare_template_data # TODO: This has to be possible with nested attributes. But I didn't figure out how.
        format.js { render js: "window.location.href = '#{dashboard_path(token: @decision.admin.invitation_token)}'" }
      else
        format.js
      end
    end
  end

  def create_decision_successful(_)
  end

  alias_method :create_decision_failed, :create_decision_successful

  def edit
    @decision = Decision.find(params[:id])
    respond_modal_with @decision, location: dashboard_path(token: @token)
  end

  def update
    @decision = Decision.find(params[:id])
    @decision.update(decision_params) if @participant.admin?
    send_mails
    respond_modal_with @decision, location: dashboard_path(token: @token)
  end

  private

  def send_mails
    DecisionMailer.send_rate_decision_emails(@decision) if params[:decision][:state] == "rate"
    DecisionMailer.send_final_decision_emails(@decision) if params[:decision][:state] == "closed"
  end

  def load_participant
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
  end

  def decision_params
    params.require(:decision).permit(:title, :description, :selected_id, :state, admin_attributes: [:name, :email])
  end

  def prepare_template_data
    @decision.options.create!(title: params[:decision][:option],
                              link: "",
                              description: I18n.t('decision.default-description'),
                              creator: @decision.admin) if params[:decision][:option]

    params[:decision][:facts].each do |f|
      @decision.facts.create!(title: f[1],
                              datatype: "NONE",
                              creator: @decision.admin)
    end if params[:decision][:facts]
  end
end
