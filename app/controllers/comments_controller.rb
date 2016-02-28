class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html do
          redirect_to project_path(@project), notice: "Thank you for commenting this project!"
        end
        format.js
      end
    else
      redirect_to project_path(@project), notice: "Something went wrong, comment not saved"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
