# == Schema Information
#
# Table name: nstudents
#
#  id            :integer         not null, primary key
#  title         :string(255)
#  designation   :string(255)
#  qualification :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  member_id     :integer
#  designated_to :string(255)
#

class Nstudent < ActiveRecord::Base

# Associations
belongs_to :member

end
