# == Schema Information
#
# Table name: tasks
#
#  id                   :integer         not null, primary key
#  user_id              :integer
#  project_id           :integer
#  name                 :string(255)
#  description          :text
#  start_date           :date
#  end_date             :date
#  invoice_number       :string(255)
#  invested_hours       :integer
#  created_at           :timestamp       not null
#  updated_at           :timestamp       not null
#  final_complexity     :float
#  corrected_complexity :float
#  url                  :string(255)
#  priority             :integer         default(2)
#

require 'spec_helper'

describe Task do
  pending "add some examples to (or delete) #{__FILE__}"
end
