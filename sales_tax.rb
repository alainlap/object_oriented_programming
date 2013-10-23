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

  # def check_type item
  #   words = item.split(' ')
    
  #   words.each do |word|
  #     word == "imported" ? 'true' : 'false'
  #   end


  # end

  # def calculate_tax item
  #   if import == true
  #     price*1.50
  #   else
  #     price*1.13
  #   end
  # end

    @new_str_a
  end
end

basket_1 = Basket.new("1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85")
basket_2 = Basket.new("1 imported box of chocolates at 10.00 1 imported bottle of perfume at 47.50")
basket_3 = Basket.new("1 imported bottle of perfume at 27.99 1 bottle of perfume at 18.99 1 packet of headache pills at 9.75 1 box of imported chocolates at 11.25")

# basket_3.print_string
# basket_2.print_string
# basket_3.print_string



def generate_receipt str_a

  total = 0
  puts "\n You have purchased: \n\n"
  str_a.each do |item|
    puts "#{item[0]} x #{item[1]}: $#{item[2]};"
    total += item[3].to_f

  end
  puts "\n Your total is: \t $#{total.round(2)}"
  puts "\n"
end

generate_receipt(basket_3.my_items)




