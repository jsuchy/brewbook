class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, :to => :@template

  def text_field(name, *args)
    _control_group({
      :label => _field_label(name, *args).to_s.html_safe, 
      :controls => super,
      :name => name
    })
  end

  def text_area(name, *args)
    _control_group({
      :label => _field_label(name, *args).to_s.html_safe, 
      :controls => super,
      :name => name
    })
  end

  def check_box(name, *args)
    _control_group({
      :controls => content_tag(:label, name.to_s.humanize, :class => "checkbox") { super },
      :name => name
    })
  end

  def number_field(method, options = {})
    options[:step] ||= "0.1"
    options[:min] ||= "0"
    options[:class] ||= "input-small"

    input = super(method, options)

    _control_group({
      :label => _field_label(method, options).to_s.html_safe,
      :controls => if options[:addon]
                     content_tag(:div, :class => "input-append") do
                       input +
                       content_tag(:span, options[:addon].html_safe, :class => "add-on")
                     end
                   else
                     input
                   end,
     :name => method
    })
  end

  def button(text=nil)
    msg = text || "Save"
    content_tag(:button, msg, :class => "btn", :type => "submit")
  end

  private

  def _control_group(options)
    error_text = object.respond_to?(:errors) && object.errors[options[:name]].join(" ")
    error = error_text.blank? ? "" : " error"
    help_span = content_tag(:span, error_text, :class => "help-inline") if error_text
    content_tag(:div, :class => "control-group#{error}") do
      options[:label].to_s.html_safe +
      content_tag(:div, :class => "controls") do
        options[:controls] + help_span
      end
    end
  end

  def _field_label(name, *args)
    options = args.extract_options!
    label_off = options.delete(:label_off)
    label(name, options[:label]) unless label_off
  end
end
