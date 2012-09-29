# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer         primary key
#  user_id    :integer
#  name       :string(255)
#  location   :string(255)
#  created_at :timestamp       not null
#  updated_at :timestamp       not null
#

class Bookmark < ActiveRecord::Base
  belongs_to :user
  attr_accessible :location, :name
end
