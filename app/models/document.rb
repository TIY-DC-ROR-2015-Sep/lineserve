class Document < ActiveRecord::Base
  has_many :lines

  validates_presence_of :name
end
