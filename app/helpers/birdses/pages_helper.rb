module Birdses
  module PagesHelper
    def index?
      current?(:index) || current_page?(root_url)
    end

    def new?
      current?(:new)
    end

    def edit?
      current?(:edit)
    end

    def create_or_update?
      if new?
        :create
      elsif edit?
        :update
      end
    end

    def post_or_put?
      if new?
        :post
      elsif edit?
        :put
      end
    end

    def current?(page)
      current_page?(controller: 'pages', action: page)
    end
  end
end
