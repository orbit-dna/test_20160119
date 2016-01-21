class SchClass < ActiveRecord::Base
	# validates :grade, presence: true, in: 1..10
	# validates :class_number, presence: true, minimum: 1
	# validates :teacher, presence: true, length: { minimum: 3} 
	def validate
		if :grade.blank? || :class_number.blank? || :teacher.blank?
			errors.add_to_base("各字段不能为空")
		end
		if :grade < 1 || :grade > 10
			errors.add_to_base("请填写正确的年级数")
		end
		if :class_number < 1 
			errors.add_to_base("请填写正确的班级数")
		end
	end

end
