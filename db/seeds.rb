mask = File.join Application::ROOT, 'db', 'seeds', '**', '*'
Dir[mask].each {|filename| require filename }
