module ApplicationHelper

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + (link_to name,'javascript:void(0)',onclick: "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to name, 'javascript:void(0)', onclick: "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"
  end

  

  def sortable(column, title = nil)
    p "********#{}*******"
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : "asc"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.permit!.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end



  def set_sidebar sidebar, current
      if sidebar.to_i == current.to_i
        return "active"
      else
        return  ""
      end 
  end  



end
