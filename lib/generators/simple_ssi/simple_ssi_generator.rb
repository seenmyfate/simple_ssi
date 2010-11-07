class SimpleSsiGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def ssi
    copy_file "ssi_controller.rb", 'app/controllers/ssi_controller.rb'
    empty_directory "app/controllers/ssi"
    empty_directory "app/views/ssi"
  end
end
