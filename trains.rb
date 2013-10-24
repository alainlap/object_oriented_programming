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

def solve_with_hashes

  a = {A: 0,    B: 5,   C: nil, D: 5,   E: 7}
  b = {A: nil,  B: 0,   C: 4,   D: nil, E: nil}
  c = {A: nil,  B: nil, C: 0,   D: 8,   E: 2}
  d = {A: nil,  B: nil, C: 8,   D: 0,   E: 6}
  e = {A: nil,  B: 3,   C: nil, D: nil, E: 0}

  e.each { |key, value|
    if value != nil 
      temp = d[:E] + value
      if (d[key] == nil) || (temp < d[key])
        d[key] = temp
      end
    end
  }

  d.each { |key, value|
    if value != nil 
      temp = c[:D] + value
      if (c[key] == nil) || (temp < c[key])
        c[key] = temp
      end
    end
  }
  c.each { |key, value|
    if value != nil 
      temp = b[:C] + value
      if (b[key] == nil) || (temp < b[key])
        b[key] = temp
      end
    end
  }
  b.each { |key, value|
    if value != nil 
      temp = a[:B] + value
      if (a[key] == nil) || (temp < a[key])
        a[key] = temp
      end
    end
  }
  # Don't go in the other direction because routes are not reversable



  p a, b, c, d, e
end

# ************************************************************

class Conductor
  
  def initialize a, b, c, d, e

    @matrix = [a, b, c, d, e]
  end

  def print_all_distances

    @matrix.each_with_index { |distances, origin|
      @matrix[origin].each_with_index { |distance, destination|
        p "The distance between #{map_location(origin)} and #{map_location(destination)} is: #{distance}"
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

# Input strings
a = [0,   5,   nil, 5,   7]
b = [nil, 0,   4,   nil, nil]
c = [nil, nil, 0,   8,   2]
d = [nil, nil, 8,   0,   6]
e = [nil, 3,   nil, nil, 0]

# Create Conductor objects
conductor = Conductor.new(a, b, c, d, e)

conductor.print_all_distances
# p solve_with_matrix
# p map_location(1)

# ************************************************************

class Station
  
  attr_accessor :to_station_A, :to_station_B, :to_station_C, :to_station_D, :to_station_E

  def initialize distances
    
    @distances = distances
    @to_station_A = @distances[0]
    @to_station_B = @distances[1]
    @to_station_C = @distances[2]
    @to_station_D = @distances[3]
    @to_station_E = @distances[4]
  end

  def distance_to_C station_B
    @to_station_C == nil ? (@to_station_C = @to_station_B + station_B.to_station_C) : false
  end

  def distance_to_D station_C
    @to_station_D == nil ? (@to_station_D = @to_station_C + station_C.to_station_D) : false
  end

  def distance_to_E station_D
    @to_station_E == nil ? (@to_station_E = @to_station_D + station_D.to_station_E) : false
  end

  def print_all_distances
    p "The distance to station A is: #{to_station_A}"
    p "The distance to station B is: #{to_station_B}"
    p "The distance to station C is: #{to_station_C}"
    p "The distance to station D is: #{to_station_D}"
    p "The distance to station E is: #{to_station_E}"
  end
end

class Conductor1

  def initialize station_A, station_B, station_C, station_D, station_E
    @station_A = station_A
    @station_B = station_B
    @station_C = station_C
    @station_D = station_D
    @station_E = station_E
  end
end

# #Input Distances
# a = [0,   5,   nil, 5,   7]
# b = [nil, 0,   4,   nil, nil]
# c = [nil, nil, 0,   8,   2]
# d = [nil, nil, 8,   0,   6]
# e = [nil, 3,   nil, nil, 0]

# # Create station objects
# station_A = Station.new(a)
# station_B = Station.new(b)
# station_C = Station.new(c)
# station_D = Station.new(d)
# station_E = Station.new(e)

# station_A.distance_to_C(station_B)
# station_B.distance_to_D(station_C)
# station_C.distance_to_E(station_D)

# # Check distances
# station_A.print_all_distances
# station_B.print_all_distances
# station_C.print_all_distances
# station_D.print_all_distances
# station_E.print_all_distances













