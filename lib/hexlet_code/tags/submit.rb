# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Submit
    def initialize(value = 'Save')
      @name = 'input'
      @value = value
    end

    attr_accessor :name, :value

    def build
      HexletCode::Tag.build(name, type: 'submit', value: value, name: 'commit')
    end
  end
end
