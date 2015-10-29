module CoinRewardSystem
  module Services
    class CalculateReward
      include Reward_Helpers


      define_resource :rage do |player_class,count|
        case player_class
        when :warrior
          count / 1
        when :wizard
          count / 0.1
        when :rogue
          count / 0.7
        end
      end

      define_resource :mana do |player_class,count|
        case player_class
        when :warrior
          count / 0.1
        when :wizard
          count / 1
        when :rogue
          count / 0.25
        end
      end

      define_resource :action do |player_class,count|
        case player_class
        when :warrior
          count / 0.7
        when :wizard
          count / 0.1
        when :rogue
          count / 1
        end
      end

    end
  end
end
