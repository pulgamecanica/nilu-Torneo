module Visitors
	class HomeController < VisitorsController
	  def index
	  	@categories = Category.active_categories.order_by_rank
	  	@posts = Post.where(active: true).order(:created_at).limit(1)
	  end
	  def info
	  	@posts = Post.where(active: true)
	  end
	end
end