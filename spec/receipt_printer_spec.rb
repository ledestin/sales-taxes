require 'open3'

def run input, expected_output
  output, = Open3.capture2e('./receipt_printer', :stdin_data => input)
  expect(output).to eq expected_output
end

describe "receipt_printer, given products, prints receipt" do
  it "input 1" do
    INPUT = <<EOF
Quantity, Product, Price
1, book, 12.49
1, music cd, 14.99
1, chocolate bar, 0.85
EOF
    EXPECTED_OUTPUT = <<EOF
1, book, 12.49
1, music cd, 16.49
1, chocolate bar, 0.85

Sales Taxes: 1.50
Total: 29.83
EOF
    run(INPUT, EXPECTED_OUTPUT)
  end

  it "input 2" do
    INPUT = <<EOF
Quantity, Product, Price
1, imported box of chocolates, 10.00
1, imported bottle of perfume, 47.50
EOF
    EXPECTED_OUTPUT = <<EOF
1, imported box of chocolates, 10.50
1, imported bottle of perfume, 54.65

Sales Taxes: 7.65
Total: 65.15
EOF
    run(INPUT, EXPECTED_OUTPUT)
  end
end
