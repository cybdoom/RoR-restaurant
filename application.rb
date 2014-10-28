class Application
  ROOT = File.dirname __FILE__

  def initialize
    load_models
  end

  private

  def load_models
    require 'active_record'
    load_validators

    mask = File.join ROOT, 'models', '**', '*'
    Dir[mask].each {|filename| require filename }
  end

  def load_validators
    require 'active_model'

    mask = File.join ROOT, 'validators', '**', '*'
    Dir[mask].each {|filename| require filename }
  end
end

Application.new
