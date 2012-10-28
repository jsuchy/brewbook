APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$: << File.join(APP_ROOT, "app", "controllers")

module ActionController
  class Base
    attr_reader :render_hash
    def self.protect_from_forgery; end
    def params; {}; end
    def render(hash); @render_hash = hash; end
  end
end

require 'application_controller'

def assigns(name)
  controller.instance_variable_get "@#{name}" 
end
