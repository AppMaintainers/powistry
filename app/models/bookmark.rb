class Bookmark < ActiveRecord::Base
  belongs_to :user
  attr_accessible :location, :name
end
