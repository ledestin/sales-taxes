require 'open3'

def run input, expected_output
  output, = Open3.capture2e('./receipt_printer', :stdin_data => input)
  expect(output).to eq expected_output
end

describe "receipt_printer, given products, prints receipt" do
  it "input 1" do
    input = <<EOF
Quantity, Product, Price
1, book, 12.49
1, music cd, 14.99
1, chocolate bar, 0.85
EOF
    expected_output = <<EOF
1, book, 12.49
1, music cd, 16.49
1, chocolate bar, 0.85

Sales Taxes: 1.50
Total: 29.83
EOF
    run(input, expected_output)
  end

  it "input 2" do
    input = <<EOF
Quantity, Product, Price
1, imported box of chocolates, 10.00
1, imported bottle of perfume, 47.50
EOF
    expected_output = <<EOF
1, imported box of chocolates, 10.50
1, imported bottle of perfume, 54.65

Sales Taxes: 7.65
Total: 65.15
EOF
    run(input, expected_output)
  end

  it "input 3" do
    input = <<EOF
Quantity, Product, Price
1, imported bottle of perfume, 27.99
1, bottle of perfume, 18.99
1, packet of headache pills, 9.75
1, imported box of chocolates, 11.25
EOF
    expected_output = <<EOF
1, imported bottle of perfume, 32.19
1, bottle of perfume, 20.89
1, packet of headache pills, 9.75
1, imported box of chocolates, 11.85

Sales Taxes: 6.70
Total: 74.68
EOF
    run(input, expected_output)
  end
end
