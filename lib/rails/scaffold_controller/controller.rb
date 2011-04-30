class <%= plural_name.titleize %>Controller < ApplicationController
  respond_to :html, :json
  
  def index
    @<%= plural_name %> = <%= file_name.singularize.titleize %>.all
    respond_with(@<%= plural_name %>)
  end
  
  def show
    @<%= file_name.singularize %> = <%= file_name.singularize.titleize %>.find(params[:id])
    respond_with(@<%= file_name.singularize %>)
  end

  def new
    @<%= file_name.singularize %> = <%= file_name.singularize.titleize %>.new
  end

  def edit
    @<%= file_name.singularize %> = <%= file_name.singularize.titleize %>.find(params[:id])
  end

  def create
    @<%= file_name.singularize %> = <%= file_name.singularize.titleize %>.new(params[:<%= file_name.singularize %>])
    flash[:notice] = '<%= file_name.singularize.titleize %> was successfully created.' if @<%= file_name.singularize %>.save
    respond_with(@<%= file_name.singularize %>)
  end

  def update
    @<%= file_name.singularize %> = <%= file_name.singularize.titleize %>.find(params[:id])
    flash[:notice] = '<%= file_name.singularize.titleize %> was successfully updated.' if @<%= file_name.singularize %>.update_attributes(params[:<%= file_name.singularize %>])
    respond_with(@<%= file_name.singularize %>)
  end

  def destroy
    @<%= file_name.singularize %> = <%= file_name.singularize.titleize %>.find(params[:id])
    @<%= file_name.singularize %>.destroy
    respond_with(@<%= file_name.singularize %>)
  end
end