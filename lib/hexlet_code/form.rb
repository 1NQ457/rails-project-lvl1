# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Form
    def initialize(model)
      @model = model
      @inner_tags = []
    end

    attr_accessor :inner_tags, :model

    def input(attribute, options = {})
      tags = case options[:as]
             when :text
               Textarea.new(attribute, options, model)
             when :selecte
               Select.new(attribute, options, model)
             else
               Input.new(attribute, options, model)
             end

      @inner_tags.push tags
    end

    def submit(value = 'Save')
      submit = Submit.new(value)
      @inner_tags.push submit
    end
  end
end
