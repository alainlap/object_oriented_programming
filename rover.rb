# OUTPUT
# The output for each rover should be its final co-ordinates and heading.
 
# INPUT AND OUTPUT
 
# Test Input:
# 5 5
# 1 2 N
# LMLMLMLMM
# 3 3 E
# MMRMMRMRRM
 
# Expected Output:
# 1 3 N
# 5 1 E

class Rover

  attr_reader :starting_position, :starting_direction, :final_position, :final_direction

  def initialize starting_position, starting_direction, commands
    @starting_position = starting_position
    @starting_direction = starting_direction
    @commands = commands
    @current_position = starting_position
    @current_direction = starting_direction
    @orientations = ["N", "E", "S", "W"]
  end

  def execute_command
    
    # puts ""
    # puts "Start: #{@current_position}, facing #{@current_direction}"
    # @counter=0
    @commands.each do |command|
      # @counter +=1
      case command
        when "L"
          rotate("left")
        when "R"
          rotate("right")
        when "M"
          move
      end
    end

    @final_position = @current_position
    @final_direction = @current_direction
  end

  def rotate direction
    current_index = @orientations.index(@current_direction)

    # TURN RIGHT
    if direction == "right"
      if current_index < 3
        new_direction = @orientations[current_index + 1]
      elsif
        new_direction = @orientations[0]
      end
      # p "#{@counter}. Turned Right: now facing #{new_direction}"
      @current_direction = new_direction
    end

    # TURN LEFT
    if direction == "left"
      if current_index > 0
        new_direction = @orientations[current_index - 1]
      elsif
        new_direction = @orientations[3]
      end
      # p "#{@counter}. Turned Left: now facing #{new_direction}"
      @current_direction = new_direction
    end
  end

  def move
    new_position = @current_position
    case @current_direction
      when "N"
        new_position[1] += 1
      when "S"
        new_position[1] -= 1
      when "E"
        new_position[0] += 1
      when "W"
        new_position[0] -= 1
    end    
    # p "#{@counter}. Moved to #{new_position}"
    @current_position = new_position
  end
end


# IGNORE PARSING INPUT FOR NOW
  grid_size = "5 5"
  spirit_start = "1 2 N"
  spirit_commands = "LMLMLMLMM"
  opportunity_start = "3 3 E"
  opportunity_commands = "MMRMMRMRRM"

# CREATE OBJECTIONS
  spirit = Rover.new([1, 2], "N", ["L", "M", "L", "M", "L", "M", "L", "M", "M"])
  opportunity = Rover.new([3, 3], "E", ["M", "M", "R", "M", "M", "R", "M", "R", "R", "M"])

# GENERATE RESULTS
  puts "\n"
  spirit.execute_command
  puts "Spirit:"
  puts "START: #{spirit.starting_position}, facing #{spirit.starting_direction}"
  puts "END: #{spirit.final_position}, facing #{spirit.final_direction}"

  puts "\n\n"
  opportunity.execute_command
  puts "Opportunity:"
  puts "START: #{opportunity.starting_position}, facing #{opportunity.starting_direction}"
  puts "END: #{opportunity.final_position}, facing #{opportunity.final_direction}"






















