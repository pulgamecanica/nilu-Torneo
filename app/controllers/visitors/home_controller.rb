module Visitors
	class HomeController < VisitorsControllers
	  def index
	  	@categories = Category.active_categories.order_by_rank
	  end
	end
end