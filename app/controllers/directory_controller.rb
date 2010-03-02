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
    case params[:distance]
    when "0" || "6"
      @contacts = Contact.find(:all, :origin => params[:contact][:postal_code])
    when "1"
      @contacts = Contact.find(:all, :origin => params[:contact][:postal_code], :within => 5)
    when "2"
      @contacts = Contact.find(:all, :origin => params[:contact][:postal_code], :within => 25)
    when "3"
      @contacts = Contact.find(:all, :origin => params[:contact][:postal_code], :within => 100)
    when "4"
      @contacts = Contact.find(:all, :origin => params[:contact][:postal_code], :within => 300)
    when "5"
      @contacts = Contact.find(:all, :origin => params[:contact][:postal_code], :within => 500)
    end

    @contacts = @contacts.paginate(:page => params[:page], :per_page => 4)
  end

end
