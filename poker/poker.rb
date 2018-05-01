class Poker
  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    max = @hands.max
    @hands.select { |hand| hand == max }.map(&:cards)
  end
end

class Hand
  include Comparable
  attr_reader :cards, :groups, :score
  RANKS   = %w(0 1 2 3 4 5 6 7 8 9 T J Q K A).freeze
  ACE     = 14
  ACE_LOW = 1
  SCORING_METHODS = %i(one_pair? two_pairs? three? straight? flush? full_house?
                       found_of_a_kind? flush_straight?).freeze

  def initialize(cards)
    @cards = cards
    ranks, @suits = @cards.map(&:chars).transpose
    @values = ranks.map { |rank| RANKS.index(rank) }.sort
    @groups = @values.chunk_while { |a, b| a == b }.sort_by(&:size).reverse
    @score = SCORING_METHODS.rindex { |scoring_method| send(scoring_method) } || -1
  end

  def <=>(other)
    [score, groups] <=> [other.score, other.groups]
  end

private
  def one_pair?
    @groups.one? { |group| group.size == 2 }
  end

  def two_pairs?
    @groups.map(&:size) == [2, 2, 1]
  end

  def three?
    @groups.first.size == 3
  end

  def straight?
    if @values.first == 2 && @values.last == ACE
      @values = [ACE_LOW] + @values[0, 4]
    end

    @values.each_cons(2).all? { |a, b| a + 1 == b }
  end

  def flush?
    @suits.all? { |suit| suit == @suits[0] }
  end

  def full_house?
    three? && one_pair?
  end

  def found_of_a_kind?
    @groups.first.size == 4
  end

  def flush_straight?
    flush? && straight?
  end
end
