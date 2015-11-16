class DocumentsController < ApplicationController
  def new
  end

  def create
    file_lines = params[:document].read.force_encoding("UTF-8").split("\n")

    doc = Document.create!(
      name:        params[:document].original_filename,
      description: params[:description],
      line_count:  file_lines.length,
      completely_uploaded: true
    )

    file_lines.each_with_index do |line, index|
      doc.lines.create!(
        content: line,
        number:  index
      )
    end

    redirect_to doc
  end

  def show
    @document = Document.find params[:id]
  end
end
