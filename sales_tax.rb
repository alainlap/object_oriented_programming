# 10% on all goods, except books, food, and medical products that are exempt.
# additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

# for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

# OUTPUT

# Output 1: 1 book : 12.49 1 music CD: 16.49 1 chocolate bar: 0.85 Sales Taxes: 1.50 Total: 29.83
# Output 2: 1 imported box of chocolates: 10.50 1 imported bottle of perfume: 54.65 Sales Taxes: 7.65 Total: 65.15
# Output 3: 1 imported bottle of perfume: 32.19 1 bottle of perfume: 20.89 1 packet of headache pills: 9.75 1 imported box of chocolates: 11.85 Sales Taxes: 6.70 Total: 74.68
# Once you're done, commit and push your work to github!


class Good
  attr_accessor :quantity, :description, :price, :exempt, :import

  def initialize quantity, description, price
    @quantity = quantity
    @description = description
    @price = price
    @exempt = false
    @import = false
  end

  def tax
      if @exempt == true
        tax_rate = 0
      else
        tax_rate = 0.1
      end

      if @import == true
        import_tax_rate = 0.05
      else
        import_tax_rate = 0
      end

      @tax = @price*(tax_rate + import_tax_rate)
      round_to_5_cents(@tax)
  end

  def price_after_tax
    (@price + tax).round(2)
  end

  def price_after_tax_round
    round_to_5_cents(@price + tax)
  end

  def round_to_5_cents value
    (value/0.05).round * 0.05
  end

  # def print_receipt

  #   "#{@quantity} #{@description} : #{price_after_tax}"
  # end
end

class Imported_Good < Good
  def initialize quantity, description, price
    super
    @import = true
  end
end

class Exempt_Good < Good
  def initialize quantity, description, price
    super
    @exempt = true
  end
end

class Imported_Exempt_Good < Good
  def initialize quantity, description, price
    super
    @exempt = true
    @import = true
  end
end




  # Input 1
  item_1A = Exempt_Good.new(1, "book", 12.49)
  item_1B = Good.new(1, "music CD", 14.99)
  item_1C = Exempt_Good.new(1, "chocolate bar", 0.85)

  input_1 = [item_1A, item_1B, item_1C]

  # Input 2
  item_2A = Imported_Exempt_Good.new(1, "imported box of chocolates", 10.00)
  item_2B = Imported_Good.new(1, "imported bottle of perfume", 47.50)

  input_2 = [item_2A, item_2B]

  # Input 3
  item_3A = Imported_Good.new(1, "imported bottle of perfume", 27.99)
  item_3B = Good.new(1, "bottle of perfume", 18.99)
  item_3C = Exempt_Good.new(1, "packet of headache pills", 9.75)
  item_3D = Imported_Exempt_Good.new(1, "box of imported chocolates", 11.25)

  input_3 = [item_3A, item_3B, item_3C, item_3D]


# *******OUTPUT
  total_tax = 0
  total = 0

    puts "\nOutput 1:"
    input_1.each do |i|
      puts "#{i.quantity} #{i.description} : #{i.price_after_tax}"

      total_tax += i.tax
      total += i.price_after_tax
    end

    puts "Sales Tax: #{total_tax}"
    puts "Total: #{total}"
# *******OUTPUT
  total_tax = 0
  total = 0

    puts "\nOutput 2:"
    input_2.each do |i|
      puts "#{i.quantity} #{i.description} : #{i.price_after_tax}"

      total_tax += i.tax
      total += i.price_after_tax
    end

    puts "Sales Tax: #{total_tax}"
    puts "Total: #{total}"
    # *******OUTPUT
  total_tax = 0
  total = 0

    puts "\nOutput 3:"
    input_3.each do |i|
      puts "#{i.quantity} #{i.description} : #{i.price_after_tax}"

      total_tax += i.tax
      total += i.price_after_tax
    end

    puts "Sales Tax: #{total_tax}"
    puts "Total: #{total}"
