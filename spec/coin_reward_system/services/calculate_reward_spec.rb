require "spec_helper"

describe CoinRewardSystem::Services::CalculateReward do
  describe "#execute!" do
    attribs = %w{rage_points mana_points action_points number_of_coins p_class}
    let(:player) {CoinRewardSystem::Models::Player.new}
    let(:rage_points)   { 20 }
    let(:mana_points)   { 20 }
    let(:action_points) { 20 }
    let(:number_of_coins) { 0 }


    context "when using a warrior" do
      let(:p_class){:warrior}
      it "player coins should be increased by 80" do
        attribs.each do |attrib|
          player.send("#{attrib}=",send(attrib))
        end
        subject{described_class.new(player)}
        expect{subject.execute!}.to change{player.number_of_coins}.by(80)
      end
    end

    context "when using a wizard" do
      let(:p_class){:wizard}
      it "player coins should be increased by 50" do
        attribs.each do |attrib|
          player.send("#{attrib}=",send(attrib))
        end
        subject{described_class.new(player)}
        expect{subject.execute!}.to change{player.number_of_coins}.by(50)
      end
    end

    context "when using a rogue" do
      let(:p_class){:rogue}
      it "player coins should be increased by 95" do
        attribs.each do |attrib|
          player.send("#{attrib}=",send(attrib))
        end
        subject{described_class.new(player)}
        expect{subject.execute!}.to change{player.number_of_coins}.by(95)
      end
    end

  end
end
