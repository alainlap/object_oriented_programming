# INPUT:

# Input 1: 1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85
# Input 2: 1 imported box of chocolates at 10.00 1 imported bottle of perfume at 47.50
# Input 3: 1 imported bottle of perfume at 27.99 1 bottle of perfume at 18.99 1 packet of headache pills at 9.75 1 box of imported chocolates at 11.25

# OUTPUT

# Output 1: 1 book : 12.49 1 music CD: 16.49 1 chocolate bar: 0.85 Sales Taxes: 1.50 Total: 29.83
# Output 2: 1 imported box of chocolates: 10.50 1 imported bottle of perfume: 54.65 Sales Taxes: 7.65 Total: 65.15
# Output 3: 1 imported bottle of perfume: 32.19 1 bottle of perfume: 20.89 1 packet of headache pills: 9.75 1 imported box of chocolates: 11.85 Sales Taxes: 6.70 Total: 74.68



# class Goods
#   # def initialize type, cost
#   #   @type = type
#   #   @cost = cost
#   # end
# end

# class Taxable_Goods < Goods

# end

# class Exempt_Goods < Goods

# end

class Basket

  def initialize str
    @str = str
  end

  def parse_string

    @str_a = @str.split(' ')
    @str_a.delete('at')

    i = 0
    while i+1 < @str_a.length do

      if (@str_a[i].to_f == 0) && (@str_a[i+1].to_f == 0)
        @str_a[i] = @str_a[i] + " " + @str_a[i+1]
        @str_a.delete_at(i+1)
        i -= 1
      end
      i += 1
    end
    return @str_a
  end

  def print_string
    p parse_string
  end

  def my_items
    @str_a = parse_string

    @items = @str_a.length/3
    @new_str_a = Array.new(@items) {Array.new(3)}

    @items.times do |n|
      @new_str_a[n][0] = @str_a[n*3]
      @new_str_a[n][1] = @str_a[n*3+1]
      @new_str_a[n][2] = @str_a[n*3+2]
    end
    @new_str_a
  end
end

# def calculate_tax price
#   after_tax = price*1.13
# end


basket_1 = Basket.new("1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85")
basket_2 = Basket.new("1 imported box of chocolates at 10.00 1 imported bottle of perfume at 47.50")
basket_3 = Basket.new("1 imported bottle of perfume at 27.99 1 bottle of perfume at 18.99 1 packet of headache pills at 9.75 1 box of imported chocolates at 11.25")

# basket_3.print_string
# basket_2.print_string
# basket_3.print_string

def check_if_imported item
  if item.includes?('import')
    true
  else
    false
  end
end

def calculate_tax price, import
  if import == true
    price*1.50
  else
    price*1.13
  end
end

def generate_receipt str_a
  total = 0
  puts "\n You have purchased: \n\n"
  str_a.each do |item|
    puts "#{item[0]} x #{item[1]}: $#{item[2]*1.13};"
    total += item[2].to_f
  end
  puts "\n Your total is: \t $#{total.round(2)}"
  puts "\n"
end

generate_receipt(basket_3.my_items)





