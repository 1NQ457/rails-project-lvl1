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
      HexletCode::Tag.build('form', action: route, method: 'post') do
        inner_tags.each_with_object([]) do |tag, result|
          result.push tag.build
        end.join
      end
    end

    def input(attribute, options = {})
      label = HexletCode::Label.new(attribute)
      tag = HexletCode::Input.new(user, attribute, options)

      @inner_tags.push label, tag
    end

    def submit(value = 'Save')
      submit = HexletCode::Submit.new(value)
      @inner_tags.push submit
    end
  end
end
