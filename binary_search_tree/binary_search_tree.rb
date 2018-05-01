class BSTNode
  attr_reader :left, :right, :data
  def initialize(data)
    @data = data
  end

  def insert(new_data)
    if new_data <= data
      left&.insert(new_data) || @left = BSTNode.new(new_data)
    else
      right&.insert(new_data) || @right = BSTNode.new(new_data)
    end
  end

  def each(&block)
    return to_enum unless block

    left&.each(&block)
    block.call(data)
    right&.each(&block)
  end
end
