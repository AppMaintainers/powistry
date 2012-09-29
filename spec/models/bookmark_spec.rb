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

require 'spec_helper'

describe Bookmark do
  pending "add some examples to (or delete) #{__FILE__}"
end
