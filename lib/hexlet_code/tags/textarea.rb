# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Textarea
    def initialize(attribute, options, model)
      @attributes = {
        cols: options[:cols] || '20',
        rows: options[:rows] || '40',
        name: attribute
      }
      @attributes[:class] = options[:class] unless options[:class].nil?
      @value = model.send(attribute)
      @label = Label.new(attributes[:name])
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
