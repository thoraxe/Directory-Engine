module ApplicationHelper
  def body_class
    "#{controller.controller_name} #{controller.controller_name}-#{controller.action_name}"
  end

  def yui_body_generator
    # for different controllers we want different yui grids, so this helper
    # will return the symbol hash for the correct body div id and class
    return case controller.controller_name
      when "contacts" then {:id => "doc4", :class => ""}
      when "contact_fields" then {:id => "doc4", :class => ""}
      else {:id => "doc4", :class => "yui-t2"}
    end
  end
  
  def display_standard_flashes(message = 'There were some problems with your submission:')
    if flash[:notice]
      flash_to_display, level = flash[:notice], 'notice'
    elsif flash[:success]
      flash_to_display, level = flash[:success], 'success'
    elsif flash[:warning]
      flash_to_display, level = flash[:warning], 'warning'
    elsif flash[:error]
      level = 'error'
      if flash[:error].instance_of? ActiveRecord::Errors
        flash_to_display = message
        flash_to_display << activerecord_error_list(flash[:error])
      else
        flash_to_display = flash[:error]
      end
    else
      return
    end
    content_tag 'div', flash_to_display, :class => "flash #{level}"
  end

  def activerecord_error_list(errors)
    error_list = '<ul class="error_list">'
    error_list << errors.collect do |e, m|
      "<li>#{e.humanize unless e == "base"} #{m}</li>"
    end.to_s << '</ul>'
    error_list
  end

end
