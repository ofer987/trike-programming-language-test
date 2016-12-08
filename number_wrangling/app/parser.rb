class Parser
  def initialize(string)
    @string = string
  end

  def operation
    return @operation unless @operation.nil?

    @string.match(%r{(\d+)\s*([#{symbols.join}])\s*(\d+)}) do |match|
        Operation.new([$1, $3], $2)
    end
  end
end
