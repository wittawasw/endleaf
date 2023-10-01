module Endleaf
  class PagesController < ApplicationController
    before_action :set_layout

    def show
      path_segments = params[:page].split('/')
      view_path = path_segments.join('/')

      render template: "pages/#{view_path}"
    end

    private

    def set_layout
      self.class.layout('endleaf')
    end
  end
end
