class Member < ActiveRecord::Base
	self.table_name = "member_t"

	has_many :tprs
	has_many :lessons
	has_many :evaluations
	has_many :worksheets

	def to_s
		"#{self.last_name}, #{self.first_name}"
	end
	
	def full_name
		"#{self.last_name}, #{self.first_name}"
	end

end
