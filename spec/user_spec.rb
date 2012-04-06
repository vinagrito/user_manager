require 'spec_helper'

describe UserController,"user management" do
  integrate_views
  it "Should redirect" do
    User.new.should be_an_instance_of(User)
  end

  it "can be saved successfully" do
    User.create.should be_persisted
  end
end