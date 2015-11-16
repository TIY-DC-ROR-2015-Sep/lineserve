class Line < ActiveRecord::Base
  belongs_to :document

  validates_presence_of :document, :number
  validates_exclusion_of :content, in: [nil]
  validates_uniqueness_of :number, scope: :document
end
