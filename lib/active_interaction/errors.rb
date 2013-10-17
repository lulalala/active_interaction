module ActiveInteraction
  InteractionInvalid = Class.new(StandardError)
  InvalidDefaultValue = Class.new(StandardError)
  InvalidNestedValue = Class.new(StandardError)
  InvalidValue = Class.new(StandardError)
  MissingValue = Class.new(StandardError)

  # TODO
  # @since 0.5.1
  class Errors < ActiveModel::Errors
    # TODO
    # @return [Hash{Symbol, Array<Symbol>}]
    attr_reader :symbolic

    # TODO
    # @param attribute [Symbol]
    # @param symbol [Symbol]
    # @param message [String, Symbol, Proc]
    # @param options [Hash]
    # @return [Hash{Symbol, Array<String>}]
    def add_sym(attribute, symbol = :invalid, message = nil, options = {})
      symbolic[attribute] ||= []
      symbolic[attribute] << symbol

      add(attribute, message || symbol, options)
    end

    # @private
    def initialize(*args)
      @symbolic = {}
      super
    end
  end
end
