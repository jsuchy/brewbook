module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).relationship.child_model.new
    id = new_object.object_id
    path = f.object.class.to_s.demodulize.tableize + "/" + association.to_s.singularize + "_fields"
    fields = f.fields_for(association, new_object, :child_index => id) do |builder|
      render(path, :f => builder)
    end
    link_to(name, '#', :class => "add_fields", :data => {:id => id, :fields => fields.gsub("\n", "")})
  end

  def control_group(options)
    id = options.fetch(:id)
    content_tag(:div, :id => id, :class => "control-group") do
      _inner_control_group(options) 
    end
  end

  def bootstrap_form_for(object, options = {}, &block)
    options[:builder] = BootstrapFormBuilder
    form_for(object, options, &block)
  end


  private

  def _inner_control_group(options)
    label = options.fetch(:label)

    label_tag(nil, label, :class => "control-label") +
    _control_group_controls(options)
  end

  def _control_group_controls(options)
    name = options.fetch(:name)
    input = _mini_input(name)
    addon = options[:addon]

    content_tag(:div, :class => "controls") do
      if addon
        _with_add_on(addon) do
          input
        end
      else
        input
      end +
      content_tag(:span, nil, :class => "help-inline")
    end
  end

  def _with_add_on(addon, &block)
    content_tag(:div, :class => "input-append") do
      yield +
      content_tag(:span, addon.html_safe, :class => "add-on")
    end
  end

  def _mini_input(name)
    text_field_tag(name, nil, :class => "input-mini")
  end
end
