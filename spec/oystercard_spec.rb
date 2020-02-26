require "oystercard"
describe Oystercard do
let(:entry_station){ double :station }
let(:exit_station){ double :station}
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

  # it "deducts money from the balance when fare is taken" do
  #   card = Oystercard.new(10)
  #   expect(card.deduct).to eq(9)
  # end

  it "is initially not in use" do
    expect(subject).not_to be_in_journey
  end

  it "responds to touch_in" do
    card = Oystercard.new(20)
    card.touch_in(entry_station)
    expect(card).to be_in_journey
  end

  it "responds to touch_out" do
    subject.touch_out(exit_station)
    expect(subject).not_to be_in_journey
  end

  it "cannot touch_in when balance is below minimum balance" do
    expect { subject.touch_in(entry_station) }.to raise_error "Balance is below minimum journey price"
  end

  it "updates balance when journey is complete" do
    card = Oystercard.new(5)
    expect { card.touch_out(exit_station) }.to change{ card.balance }.by(-Oystercard::MINIMUM_CHARGE)
  end


  it "stores the entry station when you touch in" do
    card = Oystercard.new(10)
    card.touch_in(entry_station)
    expect(card.entry_station).to eq entry_station
  end

  it "stores the exit station when you touch out" do
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end
end
