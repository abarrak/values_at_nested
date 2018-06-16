class Hash
  ##
  # Returns an array that holds the values of the given keys list of various depth.
  #
  # === Example:
  #   hash = { a: 58, b: { x: true, y: false }, c: nil }
  #   hash.values_at_nested(:b, :c)             # => [58, nil]
  #   hash.values_at_nested(:a, b: [:x])        # => [58, [true]]
  #   hash.values_at_nested(:a, b: [:x, :y])    # => [58, [true, false]]
  #
  def values_at_nested(*nested_keys)
    iterate_over_nested(nested_keys) { |k| self.dig(*k) }
  end

  def iterate_over_nested(keys)
    keys.collect do |key|
      key.is_a?(Hash) ? key.collect { |k, v| v.collect { |i| yield [k, i] } } : yield(key)
    end.flatten
  end
end

