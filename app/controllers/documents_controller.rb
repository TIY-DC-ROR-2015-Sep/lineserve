class DocumentsController < ApplicationController
  def new
  end

  def create

    doc = Document.create!(
      name:        params[:document].original_filename,
      description: params[:description]
    )
    LineScanJob.perform_later doc, params[:document].path

    redirect_to doc
  end

  def show
    @document = Document.find params[:id]
  end
end
