class Hash
  ##
  # Returns an array that holds the values of the given keys list of various depth.
  #
  # === Example:
  #   hash = { a: true, b: { x: true, y: false }, c: nil }
  #   hash.values_at_nested(:b, :c)             # => { a: true }
  #   hash.values_at_nested(:a, b: [:x])        # => { b: { y: false }, c: nil }
  #   hash.values_at_nested(:a, b: [:x, :y])    # => { c: nil }
  #   hash                                      # => { a: true, b: { x: true, y: false }, c: nil }
  #
  def values_at_nested(*nested_keys)
  end
end
