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

    def input(attribute, option = {})
      value = user[attribute]
      label = HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }
      tag = if option[:as] == :text
              HexletCode::Tag.build('textarea', cols: '20', rows: '40', name: attribute) { value }
            else
              HexletCode::Tag.build('input', type: 'text', value: value, name: attribute)
            end
      @inner_tags.push label, tag
    end

    def submit(value = 'Save')
      @inner_tags.push HexletCode::Tag.build('input', type: 'submit', value: value, name: 'commit')
    end
  end
end
