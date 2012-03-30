# == Schema Information
#
# Table name: students
#
#  id         :integer         not null, primary key
#  rollnum    :integer
#  positions  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  member_id  :integer
#

class Student < ActiveRecord::Base 

	# Associations
	belongs_to :member

	attr_accessible :rollnum, :positions
	
	# Validations
	validates :rollnum, presence: { message: 'is required'}, uniqueness: { message: 'already taken' }

end
