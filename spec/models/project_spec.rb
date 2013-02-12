require 'spec_helper'

describe Project do
  it "belongs to a user" do
    user = create(:user)
    project = create(:project, user: user)
    project.user.should == user
  end
end

describe Project, "#image" do
  it "returns the image of the first asset when assets are present" do
    asset = Asset.new
    project = Project.new
    project.assets << asset
    expect(project.image).to eq(asset.image)
  end

  it "returns a null image when assets are not present" do
    project = Project.new
    expect(project.image).to respond_to(:url)
  end
end
