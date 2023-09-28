module Endleaf
  class PagesController < ApplicationController
    before_action :set_layout

    def show
      render template: "pages/#{params[:page]}"
    end

    private

    def set_layout
      self.class.layout('endleaf')
    end
  end
end
