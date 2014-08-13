require 'open3'

describe 'receipt_printer' do
  it 'given products, prints receipt' do
    INPUT = <<EOF
Quantity, Product, Price
1, book, 12.49
1, music cd, 14.99
1, chocolate bar, 0.85
EOF
    EXPECTED_OUTPUT = <<EOF
1, book, 12.49
1, music CD, 16.49
1, chocolate bar, 0.85

Sales Taxes: 1.50
Total: 29.83
EOF

    output, = Open3.capture2e('./receipt_printer', :stdin_data => INPUT)
    expect(output).to eq EXPECTED_OUTPUT
  end
end
