module ApplicationHelper
	DEFAULT_ITEMS_PER_PAGE=5
	def paginate(
		datas,
		page_idx,
		path_format,
		items_per_page=DEFAULT_ITEMS_PER_PAGE
		)
		page_max=(datas.count-1)/items_per_page + 1
		page_max=1 if page_max < 1
		page_idx=1 if page_idx == nil or page_idx < 1
		page_idx=page_max if page_idx > page_max
		range_start=[page_idx-2,1].max
		range_end=[range_start+4,page_max].min
		range_start=[range_end-4,1].max

		page_prev=page_idx==1 ? nil : page_idx-1
		page_next=page_idx==page_max ? nil : page_idx+1

		paged_datas=datas[(page_idx-1)*items_per_page,items_per_page]
		pagination={current: page_idx, start: range_start, end: range_end,
				prev: page_prev, next: page_next, path_format: path_format,
				blank: datas.blank? }
		yield paged_datas if block_given?
		render 'layouts/pagination',{pagination: pagination}
	end
end
