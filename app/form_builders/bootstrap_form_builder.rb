class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, :to => :@template

  def text_field(name, *args)
    _field_label(name, *args).to_s.html_safe + super
  end

  def text_area(name, *args)
    _field_label(name, *args).to_s.html_safe + super
  end

  def check_box(name, *args)
    content_tag(:label, name.to_s.humanize, :class => "checkbox") do
      super
    end
  end

  def number_field(method, options = {})
    options[:step] ||= "0.1"
    options[:min] ||= "0"
    options[:class] ||= "input-small"

    input = super(method, options)

    _field_label(method, options).to_s.html_safe +
    if options[:addon]
      content_tag(:div, :class => "input-append") do
        input +
        content_tag(:span, options[:addon].html_safe, :class => "add-on")
      end
    else
      input
    end
  end

  def button(text=nil)
    msg = text || "Save"
    content_tag(:button, msg, :class => "btn", :type => "submit")
  end

  private

  def _field_label(name, *args)
    options = args.extract_options!
    label_off = options.delete(:label_off)
    label(name, options[:label]) unless label_off
  end
end
