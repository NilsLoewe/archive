require 'sinatra/base'

# Hacky, first implementation of a Sinata API DSL with parameter checking
# Tests will follow soonish ..

module Sinatra
  module APICallDSL
    def api_call(&block)
      dsl = DSL.new
      dsl.instance_eval(&block)
      dsl.execute(self)
    end
  end

  register APICallDSL
end

class DSL
  [:get, :post, :put, :delete].each do |verb|
    define_method(verb) do |path|
      fail 'invalid path' unless path.is_a?(String)
      @verb = verb
      @path = path
    end
  end

  def code(&block)
    @code = block
  end

  def parameters(&block)
    parameter_dsl = ParameterDSL.new
    parameter_dsl.instance_eval(&block)
    @parameters = parameter_dsl.parameters
  end

  def execute(app)
    # save `code` to local variable to have it accessible in the
    # defined method below
    code = @code
    parameters = @parameters

    app.send(@verb, @path) do
      begin
        parameters.each do |parameter|
          parameter.new.validate!(params)
        end
        result = instance_eval(&code)
      rescue ParameterError => e
        result = e.response
      end

      respond_to do |f|
        f.json { result.to_json }
      end
    end
  end
end

class ParameterDSL
  attr_reader :parameters

  def initialize
    @parameters = []
  end

  def method_missing(method_name, *args, &block)
    klass = Class.new(Parameter) do
      attr_accessor method_name
      validates method_name, *args
      define_method(:parameter_name) do
        method_name
      end
    end
    @parameters << klass
  end
end

class Parameter
  include ActiveModel::Validations

  def self.name
    'Parameter' # satisfy ActiveModel::Naming that wants to have a class name
  end

  def validate!(params)
    send("#{parameter_name}=", params[parameter_name])
    fail ParameterError.new(parameter: parameter_name, message: errors[parameter_name]) if invalid?
  end
end

class ParameterError < StandardError
  attr_reader :response
  def initialize(response)
    @response = response
    super
  end
end
