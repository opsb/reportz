class Report < ActiveRecord::Base
  attr_accessible :name, :query, :database_id
  belongs_to :database
  validates_format_of :query, :with => /^select.*/, :message => 'must be a select statement'
end
