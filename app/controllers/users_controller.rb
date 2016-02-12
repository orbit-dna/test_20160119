class UsersController < ApplicationController
	def index
		@user=User.new
		@users=User.all
	end
=begin
	def create
		index
		@sch_class=SchClass.new(get_sch_class_params)
		if @sch_class.save
			@sch_class=SchClass.new
		end
		render 'index'
	end
	def show
		begin
			@sch_class=SchClass.find(params[:id])
			@students,@page_range=
				paginatie (@sch_class.students.sort_by {|x| x.id}),
					params[:page].to_i, @@items_per_page,
				   	sch_class_path(@sch_class)
		rescue ActiveRecord::RecordNotFound
			index
			@sch_class.errors[:base] << "class #{params[:id]} does not exists"
			render 'index'
		end
	end
	def update
		@sch_class=SchClass.find(params[:id])
		@sch_class.update(get_sch_class_params)
		@students=@sch_class.students
		render 'show'
	end
	def destroy
		begin
			@sch_class=SchClass.find(params[:id])
			@sch_class.students.delete
			@sch_class.destroy if @sch_class
		rescue ActiveRecord::RecordNotFound
		end
		redirect_to sch_classes_path
	end

=end
	private
	def get_sch_class_params
		params.require(:sch_class).permit(:grade, :class_number, :teacher)
	end
end
