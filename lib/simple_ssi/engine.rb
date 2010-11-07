class Engine < Rails::Engine
  initializer 'my_engine.helper' do |app|
    ActionView::Base.send :include, SsiHelper
  end
end
