# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  points     :integer
#  member_id  :integer
#  post_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  up_votes   :integer         default(0), not null
#  down_votes :integer         default(0), not null
#

class Comment < ActiveRecord::Base
	make_voteable
	
	# Associations
	belongs_to :member
	belongs_to :post
	
	validates_presence_of :content
end

