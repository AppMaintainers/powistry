# == Schema Information
#
# Table name: estimations
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  task_id       :integer
#  complexity_id :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

require 'spec_helper'

describe Estimation do
  pending "add some examples to (or delete) #{__FILE__}"
end
