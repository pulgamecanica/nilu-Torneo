module Visitors
	class HomeController < VisitorsController
	  def index
	  	@categories = Category.active_categories.order_by_rank
	  end
	end
end