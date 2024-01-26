# frozen_string_literal: true

module LegislativeData
  module Models
    class Vote
      attr_accessor :id, :bill_id

      def initialize(id:, bill_id:)
        @id = id
        @bill_id = bill_id
      end

      def self.attrs
        %i[id bill_id]
      end

      def bill(bills)
        bills.find { |bill| bill.id == @bill_id }
      end
    end
  end
end
