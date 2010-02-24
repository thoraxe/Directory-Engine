class DirectoryController < ApplicationController

  layout 'customer'

  def index
    # this action should probably never be called
  end

  def show
    # needs to take some kind of ID parameter to figure out whose directory to display
    # this would be the homepage of the user's directory
    @user = User.find(params[:id])
    @contact = Contact.new
  end

  def search
    @user = User.find(params[:owner_id])
    @contact = Contact.new(params[:contact])
    @contacts = Contact.find(:all, :origin => params[:contact][:postal_code])
  end

end
