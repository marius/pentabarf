# Load the Rails framework and configure your application.
# You can include your own configuration at the end of this file.
#
# Be sure to restart your webserver when you modify this file.

# The path to the root directory of your application.
RAILS_ROOT = File.join(File.dirname(__FILE__), '..')

# The environment your application is currently running.  Don't set
# this here; put it in your webserver's configuration as the RAILS_ENV
# environment variable instead.
#
# See config/environments/*.rb for environment-specific configuration.
RAILS_ENV  = ENV['RAILS_ENV'] || 'production'


# Load the Rails framework.  Mock classes for testing come first.
ADDITIONAL_LOAD_PATHS = ["#{RAILS_ROOT}/test/mocks/#{RAILS_ENV}"]

# Then model subdirectories.
ADDITIONAL_LOAD_PATHS.concat(Dir["#{RAILS_ROOT}/app/models/[_a-z]*"])
ADDITIONAL_LOAD_PATHS.concat(Dir["#{RAILS_ROOT}/components/[_a-z]*"])

# Followed by the standard includes.
ADDITIONAL_LOAD_PATHS.concat %w(
  app 
  app/models 
  app/controllers 
  app/helpers 
  app/apis 
  components 
  config 
  lib 
  vendor 
  vendor/rails/railties
  vendor/rails/railties/lib
  vendor/rails/actionpack/lib
  vendor/rails/activesupport/lib
  vendor/rails/activerecord/lib
  vendor/rails/actionmailer/lib
  vendor/rails/actionwebservice/lib
).map { |dir| "#{RAILS_ROOT}/#{dir}" }.select { |dir| File.directory?(dir) }

# Prepend to $LOAD_PATH
ADDITIONAL_LOAD_PATHS.reverse.each { |dir| $:.unshift(dir) if File.directory?(dir) }

# Require Rails libraries.
require 'rubygems' unless File.directory?("#{RAILS_ROOT}/vendor/rails")

require 'active_support'
require 'active_record'
require 'action_controller'
require 'action_mailer'
require 'action_web_service'
require 'momomoto/momomoto'
require 'momomoto/login'
require 'momomoto/tables'
require 'momomoto/views'
require 'time'


# Environment-specific configuration.
require_dependency "environments/#{RAILS_ENV}"
Momomoto::Base.connect(YAML::load_file("#{RAILS_ROOT}/config/database.yml")[RAILS_ENV])

# Configure defaults if the included environment did not.
begin
  RAILS_DEFAULT_LOGGER = Logger.new("#{RAILS_ROOT}/log/#{RAILS_ENV}.log")
  RAILS_DEFAULT_LOGGER.level = (RAILS_ENV == 'production' ? Logger::INFO : Logger::DEBUG)
rescue StandardError
  RAILS_DEFAULT_LOGGER = Logger.new(STDERR)
  RAILS_DEFAULT_LOGGER.level = Logger::WARN
  RAILS_DEFAULT_LOGGER.warn(
    "Rails Error: Unable to access log file. Please ensure that log/#{RAILS_ENV}.log exists and is chmod 0666. " +
    "The log level has been raised to WARN and the output directed to STDERR until the problem is fixed."
  )
end

[ActiveRecord, ActionController, ActionMailer].each { |mod| mod::Base.logger ||= RAILS_DEFAULT_LOGGER }
[ActionController, ActionMailer].each { |mod| mod::Base.template_root ||= "#{RAILS_ROOT}/app/views/" }

# Set up routes.
ActionController::Routing::Routes.reload

Controllers = Dependencies::LoadingModule.root(
  File.join(RAILS_ROOT, 'app', 'controllers'),
  File.join(RAILS_ROOT, 'components')
)

# Include your app's configuration here:

# disabling sessions is broken :/
#ActionController::CgiRequest::DEFAULT_SESSION_OPTIONS=false

# we want localization in our rhtml renderer
module ActionView
  class Base
    private
      def rhtml_render(extension, template, local_assigns)
        # lets do some localization
        tags = template.scan(/<\[[a-z:_]+\]>/)
        tags.collect do | tag | 
          tag.delete!("<[]>")
        end
        if tags.length > 0
          Momomoto::View_ui_message.find({:language_id => Momomoto::Base.ui_language_id, :tag => tags}).each do | msg |
            next if msg.name.match(/[{}<>]/)
            template.gsub!( "<[" + msg.tag + "]>", h(msg.name) )
          end
        end
        b = evaluate_locals(local_assigns)
        @@compiled_erb_templates[template] ||= ERB.new(template, nil, '-')
        @@compiled_erb_templates[template].result(b)
      end
  end
end

module Momomoto
  class Base
    def log_error( text )
      ApplicationController.jabber_message( text )
    end
  end
end



