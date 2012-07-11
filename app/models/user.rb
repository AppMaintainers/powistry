class User < ActiveRecord::Base
  attr_accessible :admin, :monogram, :name
  has_many :tasks
end
