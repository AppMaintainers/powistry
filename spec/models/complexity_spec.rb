# == Schema Information
#
# Table name: complexities
#
#  id                   :integer         not null, primary key
#  code                 :string(255)
#  planned_duration_min :integer
#  planned_duration_max :integer
#  points               :integer
#  created_at           :timestamp       not null
#  updated_at           :timestamp       not null
#

require 'spec_helper'

describe Complexity do
  pending "add some examples to (or delete) #{__FILE__}"
end
