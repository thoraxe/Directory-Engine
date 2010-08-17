class ContactFieldValuesController < ApplicationController

  def new
    @contact_field_value = ContactFieldValue.new

    # grab the field that this value belongs to so we can display its name
    @contact_field = ContactField.find(params[:field])
  end

  def create
    # create a ContactFieldValue with the incoming params
    @contact_field_value = ContactFieldValue.new :contact_id => params[:contact_id], 
      :contact_field_id => params[:contact_field_id], 
      :field_value => params[:contact_field_value][:field_value],
      :user_id => current_user.id

    # before we do anything, we want to make sure that this value belongs to the user that is trying to create it
    # find the field that corresponds with this value
    @contact_field = ContactField.find(params[:contact_field_id])

    # does it belong to the current user?
    if @contact_field.user_id != current_user.id
      flash[:warning] = "That field doesn't belong to you!"
      redirect_to root_path
    else
      # the field is ours, so we will try to save it
      if @contact_field_value.save
        flash[:success] = "Value added!"
        redirect_to contacts_path
      else
        flash[:error] = "Something didn't work right.  Try again."
        render :action => 'new'
      end
    end

  end

  def update
  end

  def destroy
    # find the value
    @contact_field_value = ContactFieldValue.find(params[:id])

    if @contact_field_value.user_id != current_user.id
      flash[:warning] = "That field doesn't belong to you!"
      redirect_to root_path
    else
      # it's ours, so destroy it
      if @contact_field_value.destroy
        flash[:success] = "Deleted"
        redirect_to contacts_path
      else
        flash[:errpr] = "Something went wrong"
        redirect_to contacts_path
      end
    end
      
  end

end
