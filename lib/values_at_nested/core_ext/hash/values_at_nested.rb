class Hash
  ##
  # Returns an array that holds the values of the given keys list of various depth.
  #
  # === Example:
  #
  #   hash = { a: 58, b: { x: true, y: false }, c: nil }
  #
  #   hash.values_at_nested(:b, :c)             # => [58, nil]
  #   hash.values_at_nested(:a, b: [:x])        # => [58, [true]]
  #   hash.values_at_nested(:a, b: [:x, :y])    # => [58, [true, false]]
  #
  def values_at_nested(*nested_keys)
    nested_keys.empty? ?  [] : iterate_over_nested(nested_keys) { |k| self.dig(*k) }
  end

  def iterate_over_nested(keys)
    keys.collect do |key|
      value = self[key]

      if key.is_a?(Hash)
        key.collect do |k, v|
          if Hash === v
            yield [k, v.send(:iterate_over_nested, v.keys) { |kn| kn }].flatten
          elsif Array === v
            v.map { |vi| yield [k, vi] }
          else
            yield [k, v]
          end
        end.flatten 1

      elsif key.is_a?(Symbol) && value.is_a?(Hash)
        value.send(:iterate_over_nested, value.keys) { |k| yield [key, k] }
      elsif key.is_a?(Symbol) && value.is_a?(Symbol)
        yield [key, value]
      else
        yield key
      end
    end
  end

  private :iterate_over_nested
end
