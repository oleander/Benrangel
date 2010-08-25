class StaticController < ApplicationController
  def view
    begin
      render 'static/' + params.fetch(:path, 'index'), :layout => ! request.xhr?
    rescue ActionView::MissingTemplate
      render 404
    end
  end
end
