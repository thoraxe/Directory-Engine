module ContactsHelper

  def field_value_output_link(field, contact)
    logger.info "#{contact.name} - #{field.id}"
    value = ContactFieldValue.find_value_from_field_and_contact(field.id, contact.id).first
    if value.nil?
      link_to "Create", new_contact_field_value_path( :contact => contact.id, :field => field.id )
    end
  end

end
