class Evaluation < ActiveRecord::Base
	self.table_name = "evaluation_t"

	belongs_to :member

end
