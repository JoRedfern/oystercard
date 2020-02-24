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

  it "raises error if balance exceeds £90" do
    card = Oystercard.new
    card.balance = 90
    expect {card.top_up(0.01) }.to raise_error "Maximum balance is £90"
  end
end
