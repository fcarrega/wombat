#coding: utf-8
require 'wombat/property'

module Wombat
  class Properties
    def initialize
      @properties = []
    end

    def method_missing method, *args, &block
      @properties << Property.new(
        name: method.to_s, 
        selector: args.first, 
        format: args[1], 
        namespaces: args[2],
        callback: block)
    end

    # TODO: Why I need this?????
    def to_ary
    end

    def get_property name
      @properties.detect {|p| p.name == name }
    end

    def all_properties
      @properties
    end
  end
end