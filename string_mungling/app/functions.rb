class Functions
  class << self
    def replace_with_surrounding_character(string)
      string.gsub(%r{(\S{1})(.{1})(\1{1})}) { "#{$1}#{$1}#{$1}"}
    end

    def replace_six_characters(string)
      string.gsub(%r{(.{1})\1\1\1\1\1}) { |m| "#{$1}" }
    end

    def reverse(string)
      string.gsub(%r{^([^!]*)!{1}(.*)$}) { |m| ($1+$2).reverse }
    end
  end
end
