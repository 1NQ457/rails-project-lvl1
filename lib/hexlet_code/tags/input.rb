# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Input
    def initialize(attribute, options, model)
      @attributes = {
        type: 'text',
        name: attribute
      }
      @attributes[:class] = options[:class] unless options[:class].nil?
      @attributes[:value] = model.send(attribute) unless model.send(attribute).nil?
      @label = Label.new(attributes[:name])
    end

    attr_accessor :attributes, :label

    def build
      [
        label.build,
        Tag.build('input', **attributes)
      ]
    end
  end
end
