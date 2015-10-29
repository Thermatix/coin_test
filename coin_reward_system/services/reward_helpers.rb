module CoinRewardSystem
  module Services
    module Reward_Helpers

      def initialize(player)
        @player = player
      end

      def execute!
        self.resources.each do |resource,calculation|
          # @player.send(:number_of_coins=,calculation.call(@player.send(resource)))
          @player.send(:number_of_coins=,calculation.call(@player.p_class,@player.send(resource)))
        end
      end

      module DSL

        def define_resource ident, &block
          puts "player=#{@player}"
          @resources[ident] =  block#block.curry(@player.p_class)
        end

      end

      def self.included(child)
        child.instance_eval do
          attr_reader :resources
          @resources = {}
          extend DSL
        end
      end

    end
  end
end
