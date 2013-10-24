# Exercise 3: Trains (Bonus)

# Problem: The local commuter railroad services a number of towns in Kiwiland. 
# Because of monetary concerns, all of the tracks are 'one-way.' That is, a route
# from Kaitaia to Invercargill does not imply the existence of a route from Invercargill
# to Kaitaia. In fact, even if both of these routes do happen to exist, they are 
# distinct and are not necessarily the same distance!
# 
# The purpose of this problem is to help the railroad provide its customers with 
# information about the routes. In particular, you will compute the distance along 
# a certain route, the number of different routes between two towns, and the shortest 
# route between two towns.

# Input:  A directed graph where a node represents a town and an edge represents 
# a route between two towns.  The weighting of the edge represents the distance 
# between the two towns.  A given route will never appear more than once, and 
# for a given route, the starting and ending town will not be the same town.
 
# Output: For test input 1 through 5, if no such route exists, output 'NO SUCH ROUTE'.
# Otherwise, follow the route as given; do not make any extra stops!  
# For example, the first problem means to start at city A, then travel directly 
# to city B (a distance of 5), then directly to city C (a distance of 4).
 
# 1. The distance of the route A-B-C.
# 2. The distance of the route A-D.
# 3. The distance of the route A-D-C.
# 4. The distance of the route A-E-B-C-D.
# 5. The distance of the route A-E-D.
# 6. The number of trips starting at C and ending at C with a maximum of 3 stops.  
#    In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops).
# 7. The number of trips starting at A and ending at C with exactly 4 stops.  
#    In the sample data below, there are three such trips: A to C (via B,C,D);
#    A to C (via D,C,D); and A to C (via D,E,B).
# 8. The length of the shortest route (in terms of distance to travel) from A to C.
# 9. The length of the shortest route (in terms of distance to travel) from B to B.
# 10. The number of different routes from C to C with a distance of less than 30.  \
#    In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC.
 
# Test Input:
 
# For the test input, the towns are named using the first few letters of the alphabet from A to E.
 # A route between two towns (A to B) with a distance of 5 is represented as AB5.
 
# Graph: AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7
 
# Expected Output:
 
# Output #1: 9
# Output #2: 5
# Output #3: 13
# Output #4: 22
# Output #5: NO SUCH ROUTE
# Output #6: 2
# Output #7: 3
# Output #8: 9
# Output #9: 9
# Output #10: 7
# ************************************************************

class Station
  
  # attr_accessor :to_station_A, :to_station_B, :to_station_C, :to_station_D, :to_station_E

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

  def distance_matrix
    [@to_station_A, @to_station_B, @to_station_C, @to_station_D, @to_station_E]
  end
end

class Conductor
  
  def initialize station_A, station_B, station_C, station_D, station_E
    @station_A = station_A
    @station_B = station_B
    @station_C = station_C
    @station_D = station_D
    @station_E = station_E
  end

  def build_matrix
    a = @station_A.distance_matrix
    b = @station_B.distance_matrix
    c = @station_C.distance_matrix
    d = @station_D.distance_matrix
    e = @station_E.distance_matrix

    [a, b, c, d, e]
  end

  def print_all_distances
    @matrix = build_matrix

    @matrix.each_with_index { |distances, origin|
      @matrix[origin].each_with_index { |distance, destination|
        p "The distance between #{map_location(origin)} and #{map_location(destination)} is: #{distance}"
      }
    }
  end

  def calculate_distances
    p @matrix = build_matrix

    @matrix.each_with_index { |distances, origin|
      @matrix[origin].each_with_index { |distance, destination|
        if distance != nil 
          temp = d[:E] + distan
        elsif (d[key] == nil) || (temp < d[key])
          d[key] = temp
        end
    end

      }
    }
  end

  def map_location index

    map = {
      0 => 'Station A',
      1 => 'Station B',
      2 => 'Station C',
      3 => 'Station D',
      4 => 'Station E'
    }
    map[index]
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


# TESTING
# station_A.print_all_distances
# conductor.print_all_distances
conductor.calculate_distances

# /TESTING




# conductor.print_all_distances
# p solve_with_matrix
# p map_location(1)

# station_A.distance_to_C(station_B)
# station_B.distance_to_D(station_C)
# station_C.distance_to_E(station_D)

# # Check distances
# station_A.print_all_distances
# station_B.print_all_distances
# station_C.print_all_distances
# station_D.print_all_distances
# station_E.print_all_distances













