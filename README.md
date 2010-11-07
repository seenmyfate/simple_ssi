# simple_ssi

Make full use of Nginx Server Side Includes quickly and easily in your Rails 3 app. First up require the gem in your Gemfile:

    gem 'simple_ssi'
    
Turn on server side includes in nginx

    location / {
      ssi on;
      #etc
    }
    
In your view, use the helper to specify the action you want to include:

    <%= ssi :controller => 'users', :action => 'notifications' %>
   
Nginx will now include the HTML created by your action in the page dynamically, so you can cache the rest of the page and still include user specific information.

The example above assumes that you have something along these lines in your application:
    
    #application_controller.rb
    class ApplicationController < ActionController::Base
    
      def current_user
        #some kind current user method
      end
    end
    
    #users_controller.rb
    class Users < ApplicationController
      def notifications
        @notifications = current_user.notifications
      end
    end
    
    #views/users/notifications.html.erb
    
    <% for notification in @notifications %>
        <%# do stuff%>
    <% end %>
    
    #config/routes.rb
    
    match '/users/notifications' => 'users#notifications'
  
If you want to keep your ssi action separate, and you don't want to have to add a new route everytime, run the simple_ssi generator:

    rails g simple_ssi
    
Now simply add any methods to app/controllers/ssi_controller.rb, add a view under app/views/ssi and pass the method name to the helper:

    <%= ssi :notifications %>

* * *
To do:

* Better readme
* Example app
* Benchmarks
* Apache support


* * *

Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

* * *

Copyright (c) 2010 seenmyfate. See LICENSE for details.
