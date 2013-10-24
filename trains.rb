
module Tools

  def convert_node_to_index node
    
    case node
      when "A"
        0
      when "B"
        1
      when "C"
        2
      when "D"
        3
      when "E"
        4
    end
  end
end

class Station
  
  include Tools

  def initialize to_station_A, to_station_B, to_station_C, to_station_D, to_station_E
    
    @to_station_A = to_station_A
    @to_station_B = to_station_B
    @to_station_C = to_station_C
    @to_station_D = to_station_D
    @to_station_E = to_station_E
  end

  def print_all_distances
    p "The distance to station A is: #{@to_station_A}"
    p "The distance to station B is: #{@to_station_B}"
    p "The distance to station C is: #{@to_station_C}"
    p "The distance to station D is: #{@to_station_D}"
    p "The distance to station E is: #{@to_station_E}"
  end

  def distance_array
    [
      @to_station_A,
      @to_station_B,
      @to_station_C,
      @to_station_D,
      @to_station_E
    ]
  end

  def print_distance_to node
    distances = distance_array
    index = convert_node_to_index(node)
    distances[index]
  end

end

class Conductor
  
  include Tools

  def initialize station_A, station_B, station_C, station_D, station_E
    @station_A = station_A
    @station_B = station_B
    @station_C = station_C
    @station_D = station_D
    @station_E = station_E
  end

  def build_matrix
    a = [0,   5,   nil, 5,   7]
    b = [nil, 0,   4,   nil, nil]
    c = [nil, nil, 0,   8,   2]
    d = [nil, nil, 8,   0,   6]
    e = [nil, 3,   nil, nil, 0]

    @matrix = [a, b, c, d, e]
  end

  def calculate_distances *nodes
    total = 0
    nodes.each_index do |index|
      
      if index > 0        
        temp = distance_between(nodes[index-1], nodes[index])

        if temp.nil?
          total = "NO SUCH ROUTE"
        elsif
          total += temp
        end
      end
    end
    total
  end

  def distance_between node_1, node_2
    node_1 = convert_node_to_index(node_1)
    node_2 = convert_node_to_index(node_2)
    @matrix = build_matrix
    @matrix[node_1][node_2]
  end
end

# Create Station objects
  station_A = Station.new(0,   5,   nil, 5,   7)
  station_B = Station.new(nil, 0,   4,   nil, nil)
  station_C = Station.new(nil, nil, 0,   8,   2)
  station_D = Station.new(nil, nil, 8,   0,   6)
  station_E = Station.new(nil, 3,   nil, nil, 0)

# Create Conductor objects
conductor = Conductor.new(station_A, station_B, station_C, station_D, station_E)

# Ask Conductor questions


puts "\n 1. The distance of the route A-B-C: #{conductor.calculate_distances('A', 'B', 'C')}"
puts "\n 2. The distance of the route A-D: #{conductor.calculate_distances('A', 'D')}"
puts "\n 3. The distance of the route A-D-C: #{conductor.calculate_distances('A', 'D', 'C')}"
puts "\n 4. The distance of the route A-E-B-C-D: #{conductor.calculate_distances('A', 'E', 'B', 'C', 'D')}"
puts "\n 5. The distance of the route A-E-D: #{conductor.calculate_distances('A', 'E', 'D')}"

puts "\n 6. The number of trips starting at C and ending at C with a maximum of 3 stops.  In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops)."
puts "\n 7. The number of trips starting at A and ending at C with exactly 4 stops.  In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D); and A to C (via D,E,B)."
puts "\n 8. The length of the shortest route (in terms of distance to travel) from A to C."
puts "\n 9. The length of the shortest route (in terms of distance to travel) from B to B."
puts "\n 10. The number of different routes from C to C with a distance of less than 30.  In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC."
 












