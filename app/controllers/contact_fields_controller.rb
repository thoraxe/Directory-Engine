class ContactFieldsController < ApplicationController

  before_filter :authenticate

  def index
    # pull all of this user's contact fields
    @contact_fields = ContactField.paginate(:all, :order => "name ASC", :page => params[:page], :per_page => 20) 
  end

  def new
    @contact_field = ContactField.new
  end

  def create
    @contact_field = ContactField.new(params[:contact_field])
    if current_user.contact_fields << @contact_field
      flash[:success] = "Contact field added!"
      redirect_to contact_fields_path
    else
      flash[:error] = "There was an error with your submssion!"
      render :action => "new"
    end
  end

  def destroy
    @contact_field = ContactField.find(params[:id])
    if current_user.id == @contact_field.user_id
      @contact_field.destroy
      flash[:success] = "Deleted."
      redirect_to contact_fields_path
    else
      flash[:warning] = "You can't delete a field that is not yours."
    end
  end

end
