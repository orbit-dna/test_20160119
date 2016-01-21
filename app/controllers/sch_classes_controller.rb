class SchClassesController < ApplicationController
	def index
		@sch_classes=SchClass.all
	end
end
