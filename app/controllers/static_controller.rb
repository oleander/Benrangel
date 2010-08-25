class StaticController < ApplicationController
  def view
    if template_exists?(template = File.join('static', params.fetch(:path, 'index')))
      render :file => template, :layout => ! request.xhr?
    else
      render 404
    end
  end
end
