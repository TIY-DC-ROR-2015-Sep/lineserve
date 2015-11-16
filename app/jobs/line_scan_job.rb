class LineScanJob < ActiveJob::Base
  queue_as :default

  def perform document, uploaded_file

    i = 0
    File.open(uploaded_file).each_line do |line, index|
      document.lines.create!(
        content: line,
        number:  i
      )
      i += 1
    end

    document.update! completely_uploaded: true, line_count: i
  end
end
