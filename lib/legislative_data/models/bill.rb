# frozen_string_literal: true

module LegislativeData
  module Models
    class Bill
      attr_accessor :id, :title, :sponsor_id

      def initialize(id:, title:, sponsor_id:)
        @id = id
        @title = title
        @sponsor_id = sponsor_id
      end

      def self.attrs
        %i[id title sponsor_id]
      end

      def sponsor(legislators)
        legislators.find { |legislator| legislator.id == @sponsor_id }
      end
    end
  end
end
