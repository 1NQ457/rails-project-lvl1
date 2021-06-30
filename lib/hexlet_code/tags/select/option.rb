# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Option
    def initialize(value, selected_value)
      @attributes = {
        value: value
      }
      @value = value
      @attributes[:selected] = nil if value == selected_value
    end

    attr_accessor :attributes, :value, :label

    def build
      Tag.build('option', **attributes) { value }
    end
  end
end
