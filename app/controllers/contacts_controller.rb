class ContactsController < ApplicationController

  # make sure a user is logged in
  before_filter :authenticate

  def index
    # if someone did a search, we want to pass in those values to the SQL
    params[:search].nil? ? name = "" : name = params[:search]

    # grab all of the contact fields for this user
    @contact_fields = current_user.contact_fields
    @contacts = Contact.paginate(:all, :order => "name ASC",
                                 :conditions => ["name LIKE ? AND user_id = ?", "%#{name}%", current_user.id], :page => params[:page], :per_page => 20)
  end

  def show
    # grab this contact
    @contact = Contact.find(params[:id], :include => :contact_field_values)

    # get out of here if the contact doesn't belong to us
    if @contact.user_id != current_user.id
      flash[:warning] = "That contact didn't belong to you, sorry!"
      redirect_to root_path
    else
      @fields = current_user.contact_fields
    end

  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if current_user.contacts << @contact
      flash[:success] = "Thanks for submitting your contact!"
      redirect_to contacts_path
    else
      flash[:error] = "There was an error with your submission!"
      render :action => "new"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    # check if the contact belongs to our user
    if current_user.id == @contact.user_id
      @contact.update_attributes(params[:contact])
      if @contact.save!
        flash[:success] = "Thanks for updating your contact!"
        redirect_to contacts_path
      else
        flash[:error] = "There was an error with your submission!"
        render :action => "edit"
      end
    else
      flash[:warning] = "You're not allowed to edit contacts that don't belong to you!"
      redirect_to root_path
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if current_user.id == @contact.user_id
      @contact.destroy
      flash[:success] = "Contact #{@contact.name} successfully deleted."
      redirect_to contacts_path
    else
      flash[:error] = "You cannot delete that contact, you don't own it!"
      redirect_to contacts_path
    end
  end

end
