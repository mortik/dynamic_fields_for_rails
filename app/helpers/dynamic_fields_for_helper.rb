# encoding: utf-8
module DynamicFieldsForHelper

  def link_to_add_fields(form, association, name=nil, &block)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render("#{form.object.class.name.downcase.pluralize}/#{association.to_s.singularize}_fields", fields: builder)
    end
    style_class = DynamicFieldsForRails.add_css_classes
    if block_given?
    	link_to('#', class: "add_fields #{style_class}", data: {id: id, fields: fields.gsub("\n", "")}, &block)
    else
    	link_to(name, '#', class: "add_fields #{style_class}", data: {id: id, fields: fields.gsub("\n", "")})
  	end
  end

  def link_to_delete_fields(fields, name=nil, &block)
    link = []
    link << fields.hidden_field(:_destroy)
    style_class = DynamicFieldsForRails.delete_css_classes
    if block_given?
      link << link_to('#', class: "remove_fields #{style_class}", title: name, &block)
    else
      link << link_to(name, '#', class: "remove_fields #{style_class}")
    end
    return link.join('').html_safe
  end
end