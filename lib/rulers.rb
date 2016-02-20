require "rulers/version"
require "rulers/array"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content_type' => 'text/html'}, []]
      end  

      
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end  
  end  

  class Controller
    def initialize(env)
      @env = env
    end
    
    def env
      @env
    end  
  end 
end    

 # def get_controller_and_action(env)
 #      _, cont, action, after = 
 #      env["PATH_INFO"].split('/', 4)
 #      cont = cont.capitalize # "People"
 #      cont += "Controller" # "PeopleController"

 #      [Object.const_get(cont), action]
 #    end  