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
      HexletCode::Tag.build('form', action: route, mathod: 'Post') { inner_tags.join }
    end

    def input(attribute, option = {})
      puts inner_tags
      puts user
      value = user[attribute]
      tag = if option[:as] == :text
              HexletCode::Tag.build('textarea', cols: '20', rows: '40', name: attribute) { value }
            else
              HexletCode::Tag.build('input', type: 'text', value: value, name: attribute)
            end
      @inner_tags.push tag
    end
  end
end
