module ActiveInteraction
  # @!macro [new] attribute_method_params
  #   @param *attributes [Symbol] One or more attributes to create.
  #   @param options [Hash]
  #   @option options [Boolean] :allow_nil Allow a `nil` value.
  #   @option options [Object] :default Value to use if `nil` is given.

  # @private
  class Caster
    def self.factory(type)
      ActiveInteraction.const_get("#{type.to_s.camelize}Caster")
    end

    def self.prepare(filter, value)
      case value
        when NilClass
          if filter.options[:allow_nil]
            nil
          elsif filter.options.has_key?(:default)
            filter.options[:default]
          else
            raise MissingValue
          end
        else
          raise InvalidValue
      end
    end
  end
end