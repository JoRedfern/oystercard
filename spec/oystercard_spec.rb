require "oystercard"
describe Oystercard do

  it "creates a card with a balance of zero" do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

  it "adds money to the balance when topped-up" do
    card = Oystercard.new
    expect(card.top_up(10)).to eq(10)
  end
end
