class CommentsController < ApplicationController
  def create
    comment = build_comment
    comment.user = current_user
    comment.save
    redirect_to project
  end

  private

  def project
    @_project ||= Project.find(params[:project_id])
  end

  def build_comment
    project.comments.build(params[:comment])
  end
end
