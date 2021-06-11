# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Label
    def initialize(attribute)
      @name = 'label'
      @attribute = attribute
      @body = attribute.capitalize
    end

    attr_accessor :name, :attribute, :body

    def build
      HexletCode::Tag.build(name, for: attribute) { body }
    end
  end
end
