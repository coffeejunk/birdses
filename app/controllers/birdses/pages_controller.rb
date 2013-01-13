require_dependency "birdses/application_controller"

module Birdses
  class PagesController < ApplicationController
    before_filter :get_user

    def index
      @pages = Page.all
    end

    def new
      @page = Page.new
    end

    def create
      name    = params[:page][:name]
      content = params[:page][:raw_data]
      @page = Page.create(name, content, @user)
      redirect_to "#{pages_path}/#{name.parameterize}"
    end

    def show
      @page = Page.find_by_name(params[:id])
    end

    def edit
      @page = Page.find_by_name(params[:id])
    end

    def update
      name    = params[:id]
      content = params[:page][:raw_data]
      Page.update(name, content, @user)
      redirect_to "#{pages_path}/#{name.parameterize}"
    end

    def destroy
      Page.destroy(params[:id], @user)
      redirect_to pages_path
    end

    def preview
      preview = Page.preview(params[:name], params[:content])
      @content = preview.formatted_data
    end

    private

    def get_user
      name  = 'Anonymous'
      email = 'anon@example.com'
      if defined?(current_user)
        # this rescue is necessary because .try?(:method) does not work on
        # `current_user`
        name  = current_user.fullname rescue 'Anonymous'
        email = current_user.email    rescue 'anon@example.com'
      end
      @user = { 'name' => name, 'email' => email }
    end
  end
end
