class Line < ActiveRecord::Base
  belongs_to :document

  validates_presence_of :document, :content, :number
  validates_uniqueness_of :number, scope: :document
end
