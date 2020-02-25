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

  it "raises error if balance exceeds MAX_BALANCE" do
    card = Oystercard.new(90)
    expect {card.top_up(0.01) }.to raise_error "Maximum balance is #{Oystercard::MAX_BALANCE}"
  end

  it "deducts money from the balance when fare is taken" do
    card = Oystercard.new(10)
    expect(card.deduct(4)).to eq(6)
  end

  it "is initially not in use" do
    expect(subject).not_to be_in_journey
  end

  it "responds to touch_in" do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "responds to touch_out" do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end
  
end
