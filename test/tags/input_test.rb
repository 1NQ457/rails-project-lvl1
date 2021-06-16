# frozen_string_literal: true

require 'test_helper'

class InputTest < Minitest::Test
  def setup
    @input = ['<label for="name">Name</label>', '<input type="text" name="name" value="rob">']
    @attributes = {
      class: nil,
      type: 'text',
      name: 'name',
      value: 'rob'
    }
    @label = HexletCode::Label.new('name')
  end

  def teardown; end

  def test_input
    assert_equal @input, HexletCode::Input.new(@attributes, @label).build
  end
end
