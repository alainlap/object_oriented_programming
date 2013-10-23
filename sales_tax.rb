# 10% on all goods, except books, food, and medical products that are exempt.
# additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

# rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

# OUTPUT

# Output 1: 1 book : 12.49 1 music CD: 16.49 1 chocolate bar: 0.85 Sales Taxes: 1.50 Total: 29.83
# Output 2: 1 imported box of chocolates: 10.50 1 imported bottle of perfume: 54.65 Sales Taxes: 7.65 Total: 65.15
# Output 3: 1 imported bottle of perfume: 32.19 1 bottle of perfume: 20.89 1 packet of headache pills: 9.75 1 imported box of chocolates: 11.85 Sales Taxes: 6.70 Total: 74.68
# Once you're done, commit and push your work to github!


class Good
  attr_accessor :quantity, :description, :price

  def initialize quantity, description, price
    @quantity = quantity
    @description = description
    @price = price
  end

  def tax
    @price *= 1.10
  end

end

class Exempt_Good < Good

end

item_1 = Good.new(1, "imported bottle of perfume", 27.99)
item_2 = Good.new(1, "bottle of perfume", 18.99)
item_3 = Exempt_Good.new(1, "packet of headache pills", 9.75)
item_4 = Exempt_Good.new(1, "box of imported chocolates", 11.25)

p item_1.quantity
p item_1.description
p item_1.price



