class ProjectDocumentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @document = @project.project_documents.new(project_documents_params)
    respond_to do |format|
      if @document.save
        format.html { redirect_to @project, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @document = @project.project_documents.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end


  private
    def project_documents_params
      params.require(:project_document).permit(:caption, :file, :remote_file_url, :file_id)
    end
end
