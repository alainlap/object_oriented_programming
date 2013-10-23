class Basket

  def initialize basket_contents
    @basket_contents = basket_contents
  end

  def parse_contents

    @split = @basket_contents.split(' ')
    @split.delete('at')

    # rebuild words that belong together, i.e. "bar of chocolate"
    i = 0
    while i+1 < @split.length do
      # identify words followed by more words (not numbers!)
      if (@split[i].to_f == 0) && (@split[i+1].to_f == 0)
        @split[i] = @split[i] + " " + @split[i+1]
        @split.delete_at(i+1)
        i -= 1
      end
      i += 1
    end
    return @split
  end

  def get_item_from_basket
    
    parse_contents

    @item ={
      quantity: nil,
      description: nil,
      price: nil,
      import: nil,
      type: nil,
      tax_rate: nil
    }

    @items = []

    @no_of_items = @split.length/3

    @no_of_items.times do |n|
      @item[:quantity] = @split[n*3]
      @item[:description] = @split[n*3+1]
      @item[:price] = @split[n*3+2]

      p @item
      @items << @item
    end

    # WHY DOESN"T THIS STICK???
    return @items
  end

  def check_if_import
    
    get_item_from_basket

    # @items.each do |i|
    #   puts i[:description]
    # end
  end

end
  

  # # def check_type item
  # #   words = item.split(' ')
    
  # #   words.each do |word|
  # #     word == "imported" ? 'true' : 'false'
  # #   end


  # # end

  # # def calculate_tax item
  # #   if import == true
  # #     price*1.50
  # #   else
  # #     price*1.13
  # #   end
  # # end

  #   @new_split
  # end
# end

basket_1 = Basket.new("1 book at 12.49 1 music CD at 14.99 1 chocolate bar at 0.85")
basket_2 = Basket.new("1 imported box of chocolates at 10.00 1 imported bottle of perfume at 47.50")
basket_3 = Basket.new("1 imported bottle of perfume at 27.99 1 bottle of perfume at 18.99 1 packet of headache pills at 9.75 1 box of imported chocolates at 11.25")

# p basket_1.parse_contents
# p basket_1.get_item_from_basket

basket_1.check_if_import


# p basket_3.item


# def generate_receipt split

#   total = 0
#   puts "\n You have purchased: \n\n"
#   split.each do |item|
#     puts "#{item[0]} x #{item[1]}: $#{item[2]};"
#     total += item[3].to_f

#   end
#   puts "\n Your total is: \t $#{total.round(2)}"
#   puts "\n"
# end

# generate_receipt(basket_3.my_items)


