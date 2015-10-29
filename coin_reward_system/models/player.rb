module CoinRewardSystem
  module Models
    class Player
      include Virtus.model
      attribute :name, String
      attribute :p_class, Symbol
      attribute :rage_points, Integer
      attribute :mana_points, Integer
      attribute :action_points, Integer
      attribute :number_of_coins, Integer
    end
  end
end
