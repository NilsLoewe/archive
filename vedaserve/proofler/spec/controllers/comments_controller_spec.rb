require 'rails_helper'

RSpec.describe CommentsController do
  describe '.create' do
    let(:latest_comment) { @decision.options.first.comments.all.last }
    it 'adds the comment to the option' do
      @decision = create(:valued_decision)
      @decision.options.reload
      @token = @decision.admin.invitation_token
      xhr :post, :create, dashboard_token: @token, comment:
        {
          comment: 'hello',
          option_id: @decision.options.first.id,
          commentable_id: @decision.options.first.id,
          commentable_type: 'Option'
        }

      expect(response.code).to eql('200')
      expect(latest_comment.comment).to eql('hello')
      expect(latest_comment.participant_id).to eql(@decision.admin.id)
    end
  end
end
