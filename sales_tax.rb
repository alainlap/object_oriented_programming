# INPUT:

# Input 1: 1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85
# Input 2: 1 imported box of chocolates at 10.00 1 imported bottle of perfume at 47.50
# Input 3: 1 imported bottle of perfume at 27.99 1 bottle of perfume at 18.99 1 packet of headache pills at 9.75 1 box of imported chocolates at 11.25

# OUTPUT

# Output 1: 1 book : 12.49 1 music CD: 16.49 1 chocolate bar: 0.85 Sales Taxes: 1.50 Total: 29.83
# Output 2: 1 imported box of chocolates: 10.50 1 imported bottle of perfume: 54.65 Sales Taxes: 7.65 Total: 65.15
# Output 3: 1 imported bottle of perfume: 32.19 1 bottle of perfume: 20.89 1 packet of headache pills: 9.75 1 imported box of chocolates: 11.85 Sales Taxes: 6.70 Total: 74.68


# Parse the input string into something useful


# class Goods
  
#   def initialize type, cost
#     @type = type
#     @cost = cost
#   end

# end

# Book = Goods.new(book, 12.49)



def parse_string str

  str_a = str.split(' ')
  str_a.delete('at')

  for i in 0..(str_a.length-1)

    if (str_a[i].to_f == 0) && (str_a[i+1].to_f == 0)
      str_a[i] = str_a[i] + " " + str_a[i+1]
      str_a[i+1] = nil  
    end
  end
  str_a.delete(nil)
  str_a
end

# def calculate_tax price

#   after_tax = price*1.13
# end



p parse_string("1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85")



