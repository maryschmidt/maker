require 'spec_helper'

describe Step do
  it "should belong to a project" do
    user = create(:user)
    project = create(:project, user: user)
    project.user.should == user
    step = create(:step, project: project)
    step.project.should == project
  end
end
