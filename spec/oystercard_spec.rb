require "oystercard"
describe Oystercard do
  it "has a balance of zero" do
    card = Oystercard.new
    expect(card).to respond_to(:balance)
  end
end
