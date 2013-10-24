
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

    a = @station_A.distance_array
    b = @station_B.distance_array
    c = @station_C.distance_array
    d = @station_D.distance_array
    e = @station_E.distance_array
    matrix = [a, b, c, d, e]
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
    matrix = build_matrix
    matrix[node_1][node_2]
  end

  def possible_routes origin, destination

    matrix = build_matrix
    origin = convert_node_to_index(origin)
    destination = convert_node_to_index(destination)

    matrix[origin].each_with_index do |distance, destination|
      if (distance != nil) && (distance != 0)
        first_jump = destination
        p "from Station #{origin}, we can go to #{first_jump}"
      end
    end



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
  # puts "1. #{conductor.calculate_distances('A', 'B', 'C')}"
  # puts "2. #{conductor.calculate_distances('A', 'D')}"
  # puts "3. #{conductor.calculate_distances('A', 'D', 'C')}"
  # puts "4. #{conductor.calculate_distances('A', 'E', 'B', 'C', 'D')}"
  # puts "5. #{conductor.calculate_distances('A', 'E', 'D')}"

  # puts "6."
  # puts "7."
  # puts "8."
  # puts "9."
  # puts "10."
   

conductor.possible_routes("A", "C")










