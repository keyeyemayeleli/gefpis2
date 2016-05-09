class Tutee < ActiveRecord::Base
	self.table_name = "tutee_t"

	has_many :worksheets
	has_many :tprs

	def to_s
		"#{self.last_name}, #{self.first_name}"
	end

end
