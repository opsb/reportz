class Report < ActiveRecord::Base
  attr_accessible :name, :query, :database_id
end
