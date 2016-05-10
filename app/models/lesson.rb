class Lesson < ActiveRecord::Base

	self.table_name = "module_t"

	belongs_to :member
	has_one :worksheet
	has_many :tprs

	def to_s
		"#{self.file_name}"
	end
	
	has_attached_file :file, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
	attr_accessor :file_file_name
	attr_accessor :document_file_name
	#validates_attachment_content_type :file, :content_type => ['application/pdf', 'application/msword', 'text/plain']
	validates_attachment_content_type :file, :content_type => ["application/pdf"]
 	before_post_process :file

end
