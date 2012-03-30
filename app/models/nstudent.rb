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
	belongs_to :member, inverse_of: :department
	
	# Validations
		validates :title, :designation, :qualification, presence: { message: "can't be blank" } 		
		validates :title, 
			inclusion: { in: %w{ Mr. Ms. Mrs. Dr. Prof. Shri Smt Sir Madam },
									 message: "%{value} is not a valid title" }
									 
		validates :designation,
			inclusion: { in: %w{ Chairman Director Registrar Dean HOD Reader Professor Associate-Professor Assistant-Professor Lecturer AWS},
									 message: "%{value} is not a valid title" }

end
