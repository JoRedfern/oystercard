require "oystercard"
describe Oystercard do

  it "creates a card with a balance of zero" do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end
end
