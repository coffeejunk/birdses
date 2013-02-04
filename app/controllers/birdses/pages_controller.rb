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
      render_404 unless @page
    end

    def edit
      @page = Page.find_by_name(params[:id])
      render_404 unless @page
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
      md = Page.preview(params[:name], params[:md_content])
      html = md.formatted_data

      respond_to do |format|
        format.json { render :json => { :html => html } }
      end
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

    def render_404
      respond_to do |type|
        type.html { render :template => "birdses/pages/404",
                    :layout => 'application', :status => 404 }
        type.all  { render :nothing => true, :status => 404 }
      end
    end
  end
end
