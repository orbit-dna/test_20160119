class StudentsController < ApplicationController
	def index
		@student=Student.new
		@students=Student.all.sort_by {|x| x.id}
	end
	def create
		index
		@student=Student.new(get_student_params)
		sch_class=nil
		id=params.require(:sch_class)[:id]
		begin
			sch_class=SchClass.find(id)
		rescue
			@student.errors[:base] << "指定班级不存在"
		end unless id.blank?
		if @student.errors.count == 0 and @student.save
			sch_class.students.append(@student) unless sch_class.blank?
			@student=Student.new
		end
		# sch_class=nil
		render 'index'
	end 
	def show
		begin
			@student=Student.find(params[:id])
			@sch_class=@student.sch_class
		rescue ActiveRecord::RecordNotFound
			index
			@student.errors[:base] << "student #{params[:id]} does not exists"
			render 'index'
		end
	end
	def update
		@sch_class=nil
		id=params.require(:sch_class)[:id]
		begin
			@sch_class=SchClass.find(id)
		rescue
			@student.errors[:base] << "指定班级不存在"
		end unless id.blank?
		@student=Student.find(params[:id])
		@student.update(get_student_params)
		if @sch_class.blank?
			origin_class=@student.sch_class
			origin_class.students.delete @student unless origin_class.blank?
		else
			@sch_class.students.append(@student) 
		end
		render 'show'
	end
	def destroy
		begin
			@student=Student.find(params[:id])
			@student.destroy
		rescue ActiveRecord::RecordNotFound
		end
		redirect_to request.referer
	end

	private 
	@@items_per_page=5
	def get_student_params
		params.require(:student).permit(:name, :gender, :birth)
	end
end
