class <%= class_name %>Controller < ApplicationController
  respond_to :html, :json
  
  def index
    @<%= plural_name %> = <%= file_name.titleize %>.all
    respond_with(@<%= plural_name %>)
  end
  
  def show
    @<%= file_name %> = <%= file_name.titleize %>.find(params[:id])
    respond_with(@<%= file_name %>)
  end

  def new
    @<%= file_name %> = <%= file_name.titleize %>.new
  end

  def edit
    @<%= file_name %> = <%= file_name.titleize %>.find(params[:id])
  end

  def create
    @<%= file_name %> = <%= file_name.titleize %>.new(params[:user])
    
    if @<%= file_name %>.save
      flash[:notice] = '<%= file_name.titleize %> was successfully created.'
    end
    
    respond_with(@<%= file_name %>)
  end

  def update
    @<%= file_name %> = <%= file_name.titleize %>.find(params[:id])

    if @<%= file_name %>.update_attributes(params[:user])
      flash[:notice] = '<%= file_name.titleize %> was successfully updated.'
    end
    
    respond_with(@<%= file_name %>)
  end

  def destroy
    @<%= file_name %> = <%= file_name.titleize %>.find(params[:id])
    @<%= file_name %>.destroy
    respond_with(@<%= file_name %>)
  end
  
end