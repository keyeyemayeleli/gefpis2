class Member < ActiveRecord::Base
	self.table_name = "member_t"

	has_many :tprs
	has_many :lessons
	has_many :evaluations
	has_many :worksheets

end
