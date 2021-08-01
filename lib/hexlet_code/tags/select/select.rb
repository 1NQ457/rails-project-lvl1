# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Select
    def initialize(attribute, options, model)
      @attributes = {
        name: attribute
      }
      @attributes[:class] = options[:class] unless options[:class].nil?
      @value = model.send(attribute)
      @inner_tags = options[:collection].each_with_object([]) do |name, acc|
        acc.push(Option.new(name, @value))
      end
      @label = Label.new(attributes[:name])
    end

    attr_accessor :attributes, :value, :label, :inner_tags

    def build
      [
        label.build,
        Tag.build('select', **@attributes) do
          @inner_tags.each_with_object([]) do |tag, acc|
            acc.push tag.build
          end.join
        end
      ]
    end
  end
end
