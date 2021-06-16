# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Form
    def initialize(model)
      @model = model
      @inner_tags = []
    end

    attr_accessor :inner_tags, :model

    def build(route = '#')
      Tag.build('form', action: route, method: 'post') do
        inner_tags.each_with_object([]) do |tag, result|
          result.push tag.build
        end.join
      end
    end

    def input(attribute, options = {})
      tags = if options[:as] == :text
               generate_textarea(attribute, options)
             else
               generate_input(attribute, options)
             end

      @inner_tags.push tags
    end

    def generate_textarea(attribute, options)
      attributes = {
        class: options[:class],
        cols: options[:cols] || '20',
        rows: options[:rows] || '40',
        name: attribute
      }
      value = model[attribute]
      label = Label.new(attributes[:name])
      Textarea.new(attributes, value, label)
    end

    def generate_input(attribute, options)
      attributes = {
        class: options[:class],
        type: 'text',
        name: attribute,
        value: model[attribute]
      }
      label = Label.new(attributes[:name])
      Input.new(attributes, label)
    end

    def submit(value = 'Save')
      submit = Submit.new(value)
      @inner_tags.push submit
    end
  end
end
