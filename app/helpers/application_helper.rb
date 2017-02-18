module ApplicationHelper
  
  # Form error display UI
  def error_display(resource)
    return if resource.errors.blank?
    content_tag(:div) do
      concat('Fix following errors')
      concat(content_tag(:ul) do
        resource.errors.full_messages.each do |msg|
          concat(content_tag(:li, msg, class: "text-danger")) 
        end       
      end) 
    end 
  end

end
