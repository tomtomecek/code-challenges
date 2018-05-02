class Garden
  PLANTS = { "V" => :violets,
             "R" => :radishes,
             "C" => :clover,
             "G" => :grass }.freeze
  KIDS = %w(Alice Bob Charlie David Eve Fred Ginny
            Harriet Ileana Joseph Kincaid Larry).freeze

  def initialize(diagram, kids = KIDS)
    @kids   = standardize_kids(kids)
    @garden = transform_into_garden(diagram)
    define_getters_for_kids
  end

private
  def define_getters_for_kids
    @kids.each_with_index do |kid_name, idx|
      define_singleton_method(kid_name) do
        @garden[ idx ]
      end
    end
  end

  def transform_into_garden(diagram)
    seed_groups = transform_to_seed_groups(diagram)
    seed_groups.map { |seeds| seeds_to_plants(seeds) }
  end

  def transform_to_seed_groups(diagram)
    diagram.split.map { |row| row.scan(/(.)(.)/) }.transpose
  end

  def seeds_to_plants(seeds)
    seeds.flatten.map { |seed| PLANTS[seed] }
  end

  def standardize_kids(kids)
    kids.map { |kid| kid.downcase }.sort
  end
end
