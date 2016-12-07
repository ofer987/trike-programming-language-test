class StringDemystifier
  def initialize(string)
    @string = string
  end

  def demystify
    current = nil
    new_value = @string

    while (new_value != current)
      current = new_value
      new_value = Functions.replace_with_surrounding_character(new_value)
      new_value = Functions.replace_six_characters(new_value)
      new_value = Functions.reverse(new_value)
    end

    new_value
  end
end
