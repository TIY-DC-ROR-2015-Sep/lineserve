class LinesController < ApplicationController
  before_action { request.format = :json }

  def show
    @document = Document.find params[:document_id]
    @line     = @document.lines.find_by number: params[:line_number]
  end
end
