require 'nginx_ssi'
require 'rails'
module SimpleSsi
  #
  # Nginx Server Side Includes
  #
  require 'nginx_ssi/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
