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

def solve_with_matrix

  # matrix = Array.new(5) {Array.new(5)}



  a = [0,   5,   nil, 5,   7]
  b = [nil, 0,   4,   nil, nil]
  c = [nil, nil, 0,   8,   2]
  d = [nil, nil, 8,   0,   6]
  e = [nil, 3,   nil, nil, 0]

  matrix = [a, b, c, d, e]

  matrix.each_with_index { |distances, origin|
    matrix[origin].each_with_index { |distance, destination|
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

# p solve_with_matrix
# p map_location(1)


class Station
  
  attr_accessor :to_station_A, :to_station_B, :to_station_C, :to_station_D, :to_station_E

  def initialize distances
    
    @distances = distances
    # @to_station_A = "Unknown"
    # @to_station_B = "Unknown"
    # @to_station_C = "Unknown"
    # @to_station_D = "Unknown"
    # @to_station_E = "Unknown"

    @to_station_A = @distances[0]
    @to_station_B = @distances[1]
    @to_station_C = @distances[2]
    @to_station_D = @distances[3]
    @to_station_E = @distances[4]
  end

  def distance_to

  end
end


#Input Distances
a = [0,   5,   nil, 5,   7]
b = [nil, 0,   4,   nil, nil]
c = [nil, nil, 0,   8,   2]
d = [nil, nil, 8,   0,   6]
e = [nil, 3,   nil, nil, 0]

# Create station objects
station_A = Station.new(a)
station_B = Station.new(b)
station_C = Station.new(c)
station_D = Station.new(d)
station_E = Station.new(e)

# Check distances
p station_A.to_station_A
p station_A.to_station_B
p station_A.to_station_C
p station_A.to_station_D
p station_A.to_station_E
















