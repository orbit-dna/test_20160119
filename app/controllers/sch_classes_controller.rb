class SchClassesController < ApplicationController
	def index
		@sch_class=SchClass.new
		@sch_classes,@page_range=
			paginatie (SchClass.all.sort_by {|x| [x.grade,x.class_number]}),
				params[:page].to_i, @@items_per_page, sch_classes_path
	end
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

	private
	@@items_per_page=5
	def get_sch_class_params
		params.require(:sch_class).permit(:grade, :class_number, :teacher)
	end
	def paginatie(datas,page_id,items_per_page,base_path)
		page_max=(datas.count-1)/items_per_page
		page_max=0 if page_max < 0
		page_id-=1
		page_id=0 if page_id < 0
		page_id=page_max if page_id > page_max
		range_current=page_id+1
		range_start=range_current-2
		range_start=1 if range_start < 1
		range_end=range_current+2
		range_end=page_max+1 if range_end > page_max+1
		range_prev=page_id==0 ? nil : range_current-1
		range_next=page_id==page_max ? nil : range_current+1
		return datas[page_id*items_per_page,items_per_page],
			{current: range_current, start: range_start, end: range_end,
				prev: range_prev, next: range_next, base_path: base_path }
	end
end
