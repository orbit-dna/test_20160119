class StudentsController < ApplicationController
	def index
		@students=Student.all
		@student=Student.new
	end
	def create
		index
		@student=Student.new(get_student_params)
		sch_class=nil
		# render plain: [@sch_class.inspect, @student.inspect]
		id=params.require(:sch_class)[:id]
		begin
			sch_class=SchClass.find(id)
		rescue
			@student.errors[:all] << "指定班级不存在"
		end unless id.blank?
		if @student.errors.count == 0 and @student.save
			sch_class.students.append(@student) unless sch_class.blank?
			@student=Student.new
		end
		# sch_class=nil
		render 'index'
	end 
	def destroy
		@student=Student.find(params[:id])
		@student.destroy
		redirect_to students_path
	end

	private 
	def get_student_params
		params.require(:student).permit(:name, :gender, :birth)
	end
end
