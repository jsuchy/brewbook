module ApplicationHelper
  def control_group(options)
    id = options.fetch(:id)
    content_tag(:div, :id => id, :class => "control-group") do
      _inner_control_group(options) 
    end
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
