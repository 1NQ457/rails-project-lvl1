# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Textarea
    def initialize(attributes, value, label)
      @attributes = attributes
      @value = value
      @label = label
    end

    attr_accessor :attributes, :value, :label

    def build
      [
        label.build,
        Tag.build('textarea', **@attributes) { value }
      ]
    end
  end
end
