require 'spec_helper'

describe Profile do

  let(:user) { FactoryGirl.create(:user) }
  before { @profile = user.build_profile(content: "Lorem ipsum", title: "Test") }

  subject { @profile }

  it { should respond_to(:content) }
  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Profile.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @profile.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @profile.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @profile.content = "a" * 401 }
    it { should_not be_valid }
  end

end
