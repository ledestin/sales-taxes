# SALES TAXES

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt that lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets; this application should be written in Ruby [1] and use Rspec [2] to test inputs and the expected outputs. The output should be to standard out or CSV.

Proper object orientated design is important. Each row in the input represents a line item of the receipt.

# INPUT

## Input 1
Quantity, Product, Price
1, book, 12.49
1, music cd, 14.99
1, chocolate bar, 0.85

## Input 2
Quantity, Product, Price
1, imported box of chocolates, 10.00
1, imported bottle of perfume, 47.50

## Input 3
Quantity, Product, Price
1, imported bottle of perfume, 27.99
1, bottle of perfume, 18.99
1, packet of headache pills, 9.75
1, box of imported chocolates, 11.25

# OUTPUT

## Output 1
1, book, 12.49
1, music CD, 16.49
1, chocolate bar, 0.85

Sales Taxes: 1.50
Total: 29.83

## Output 2
1, imported box of chocolates, 10.50
1, imported bottle of perfume, 54.65

Sales Taxes: 7.65
Total: 65.15

## Output 3
1, imported bottle of perfume, 32.19
1, bottle of perfume, 20.89
1, packet of headache pills, 9.75
1, imported box of chocolates, 11.85

Sales Taxes: 6.70
Total: 74.68

# Coding Style
Please follow the guidelines below when developing this project.
-   PHP Coding Style Guidelines : http://www.php-fig.org/psr/psr-2/
-   Ruby Coding Style Guidelines http://net.tutsplus.com/tutorials/ruby/ruby-for-newbies-testing-with-rspec/ https://github.com/styleguide

# References
[1] http://www.ruby-lang.org
[2] https://www.relishapp.com/rspec/