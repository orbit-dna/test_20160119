class SchClassesController < ApplicationController
	def index
		@sch_class=SchClass.new
		@sch_classes=SchClass.all
	end
	def create
		index
		@sch_class=SchClass.new(get_sch_class_params)
		if @sch_class.save
			@sch_class=SchClass.new
		end
		render 'index'
	end

	private
	def get_sch_class_params
		params.require(:sch_class).permit(:grade, :class_number, :teacher)
	end
end
