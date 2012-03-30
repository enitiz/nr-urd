# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  member_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  up_votes   :integer         default(0), not null
#  down_votes :integer         default(0), not null
#

class Post < ActiveRecord::Base
	make_voteable
	
	#Associations
	belongs_to :member
	has_many :comments, :order => 'points', :dependent => :destroy
	
	accepts_nested_attributes_for :comments
	
end

