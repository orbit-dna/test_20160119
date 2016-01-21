class SchClass < ActiveRecord::Base
=begin
	validates :grade, presence: true, 
		numericality: {greater_than:0,less_than:10}
	validates :class_number, presence: true,
		numericality: {greater_than:0}
	validates :teacher, presence: true, length: { minimum: 3} 
=end
	validate :all_in_one_validate 
	def all_in_one_validate
		if not grade.blank?
			errors.add(:grade,"must be integer") unless grade.is_a?(Integer)
			if grade < 1 || grade > 10
				errors.add(:grade,"must in 1...10")
			end
		else
			errors.add(:grade,"is blank")
		end
		if not class_number.blank?
			errors.add(:class_number,"must be integer") unless 
				class_number.is_a?(Integer) 
			if class_number < 1 
				errors.add(:class_number,"must be greater than 0")
			end
		else
			errors.add(:class_number,"is blank") 
		end
		if teacher.blank?
			errors.add(:teacher,"is blank") 
		else
			if teacher.length < 3
				errors.add(:teacher,"must longer than 3") 
			end
		end
		sch_cls=SchClass.find_by grade: grade, class_number: class_number
		if not sch_cls.blank?
			errors[:base] << 
				"there has been a class #{grade}-#{class_number}"
		end
	end

end
