class Database < ActiveRecord::Base
  attr_accessible :name, :username, :password, :hostname
end
