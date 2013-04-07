# encoding: utf-8
module DynamicFormForHelper

  def link_to_add_fields(form, association, name=nil, &block)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", fields: builder)
    end
    style_class = "button small radius right"
    if block_given?
    	link_to('#', class: "add_fields #{style_class}", data: {id: id, fields: fields.gsub("\n", "")}, &block)
    else
    	link_to(name, '#', class: "add_fields #{style_class}", data: {id: id, fields: fields.gsub("\n", "")})
  	end
  end

  def link_to_delete_fields(fields, name=nil, style_class=nil, &block)
    if style_class.blank?
      style_class = "button alert radius postfix"
    end
    link = []
    link << fields.hidden_field(:_destroy)
    if block_given?
      link << link_to('#', class: "remove_fields #{style_class}", title: name, &block)
    else
      link << link_to(name, '#', class: "remove_fields #{style_class}")
    end
    return link.join('').html_safe
  end
end