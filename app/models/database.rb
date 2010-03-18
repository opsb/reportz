class Database < ActiveRecord::Base
  attr_accessible :name, :username, :password, :hostname, :schema
  has_many :reports
end
