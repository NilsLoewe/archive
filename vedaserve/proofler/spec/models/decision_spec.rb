# == Schema Information
#
# Table name: decisions
#
#  id                       :integer          not null, primary key
#  title                    :string(255)
#  description              :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  general_invitation_token :string
#  admin_id                 :integer
#  state                    :string
#  selected_id              :integer
#

require 'rails_helper'

RSpec.describe Decision, type: :model do
  subject { @decision = create(:decision) }

  it { should respond_to(:title) }
  it { should respond_to(:state) }
  it { should respond_to(:description) }
  it { should respond_to(:general_invitation_token) }

  it { should respond_to(:participants) }
  it { should respond_to(:admin) }
  it { should respond_to(:options) }
  it { should respond_to(:facts) }

  it "must have a title" do
    expect(build(:decision, title: nil)).to be_invalid
  end

  it "creates and links an admin on create" do
    decision = Decision.new(title: 'foo', admin_attributes: attributes_for(:admin))
    decision.save!

    expect(decision.admin.decision_id).to eql(decision.id)
  end

  it "does not require a admin" do
    decision = Decision.new(title: 'foo')
    expect { decision.save! }.to_not raise_error
  end

  it "generates a general_invitation_token on create" do
    decision = build(:decision, general_invitation_token: nil)
    decision.save!

    expect(decision.reload.general_invitation_token.length).to be_present
  end

  it "does not create a new general_invitation_token if already exists" do
    decision = create(:decision)
    old_token = decision.reload.general_invitation_token

    decision.save!

    expect(decision.reload.general_invitation_token).to eql(old_token)
  end
end
