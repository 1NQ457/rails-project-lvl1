# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Form
    def initialize(model)
      @user = model
      @inner_tags = []
    end

    attr_accessor :inner_tags, :user

    def build(route = '#')
      HexletCode::Tag.build('form', action: route, mathod: 'post') { inner_tags.join }
    end

    def input(attribute, options = {})
      value = user[attribute]
      label = HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }
      tag = if options[:as] == :text
              HexletCode::Tag.build('textarea', class: option[:class],
                                                cols: options[:cols] || '20',
                                                rows: options[:rows] || '40',
                                                name: attribute) { value }
            else
              HexletCode::Tag.build('input', class: option[:class], type: 'text', value: value, name: attribute)
            end
      @inner_tags.push label, tag
    end

    def submit(value = 'Save')
      @inner_tags.push HexletCode::Tag.build('input', type: 'submit', value: value, name: 'commit')
    end
  end
end
