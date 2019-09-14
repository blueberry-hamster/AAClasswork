require "tdd"

RSpec.describe "#my_uniq" do  
  it "takes in an array" do
    expect { my_uniq([]) }.to_not raise_error
  end
  it "returns a new array" do
    arr = []
    expect(my_uniq(arr)).to_not be(arr) 
  end
  it "returns unique elements in order" do
    arr = [1,2,3,2,4,5,1]
    expect(my_uniq(arr)).to eq(arr.uniq)
  end
end

RSpec.describe "Array#two_sum" do
  it "is an Array method" do
    expect { [].two_sum }.to_not raise_error
  end
  it "finds all pairs of positions where the elements at those positions sum to zero" do
    arr = [-1, 0, 2, -2, 1]
    expect(arr.two_sum).to contain_exactly([0, 4], [2, 3])
  end
  it "orders smaller first elements first, and then smaller second elements first" do
    arr = [-1, 0, 2, -2, 1]
    expect(arr.two_sum).to match_array([[0, 4], [2, 3]])
  end
end

RSpec.describe "#my_transpose" do
  it "takes in a 2D array" do
    expect { my_transpose([[]]) }.to_not raise_error
  end
  it "converts between the row and columns" do
    matrix = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    expect(my_transpose(matrix)).to eq(matrix.transpose)
  end
end

RSpec.describe "#stock_price" do
  it "takes in an array" do
    expect { stock_price([]) }.to_not raise_error
  end
  it "returns the most profitable days to buy and sell stocks" do
    arr = [3, 21, 6, 19, 1, 3]
    expect(stock_price(arr)).to eq([0, 1])
  end
end