class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @document = @project.project_documents.find(params[:project_document_id])
    @comment = @document.comments.new(comment_params)
    @comment.project_id = @project.id
    @comment.user = current_user
    @comment.save!
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @document = ProjectDocument.find(params[:project_document_id])
    @comment = @document.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
