# encoding: utf-8
module DynamicFieldsForHelper

  def link_to_add_fields(form, association, name=nil, css_classes=nil, &block)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render("#{form.object.class.name.downcase.pluralize}/#{association.to_s.singularize}_fields", fields: builder)
    end
    css_classes = css_classes(DynamicFieldsForRails.add_css_classes, css_classes)
    if block_given?
    	link_to('#', class: css_classes, data: {id: id, fields: fields.gsub("\n", "")}, &block)
    else
    	link_to(name, '#', class: css_classes, data: {id: id, fields: fields.gsub("\n", "")})
  	end
  end

  def link_to_delete_fields(fields, name=nil, css_classes=nil, &block)
    link = []
    link << fields.hidden_field(:_destroy)
    css_classes = css_classes(DynamicFieldsForRails.delete_css_classes, css_classes)
    if block_given?
      link << link_to('#', class: css_classes, title: name, &block)
    else
      link << link_to(name, '#', class: css_classes)
    end
    return link.join('').html_safe
  end

  protected

  def css_classes(default, css_class)
    style_class = []
    style_class << default unless default.blank?
    style_class << css_class unless css_class.blank?
    style_class.join(' ')
  end
end