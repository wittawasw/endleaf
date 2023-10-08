module Endleaf
  class PagesController < ApplicationController
    before_action :set_layout

    def show
      path_segments = params[:page].split('/')
      view_path = path_segments.join('/')

      render template: "#{path}/#{view_path}"
    end

    private

    def set_layout
      self.class.layout(page_layout)
    end

    def page_layout
      unless params[:layout].blank?
        params[:layout]
      else
        Endleaf::Config::DEFAULT_LAYOUT
      end
    end

    def path
      unless params[:path].blank?
        params[:path]
      else
        Endleaf::Config::DEFAULT_PATH
      end
    end
  end
end
