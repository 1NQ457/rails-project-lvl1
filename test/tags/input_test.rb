# frozen_string_literal: true

require 'test_helper'

class InputTest < Minitest::Test
  def setup
    @structure = Struct.new(:name, :job, keyword_init: true)
    @model = @structure.new name: 'rob', job: 'hexlet'
    @tags = [
      '<label for="name">Name</label>',
      '<input type="text" name="name" value="rob">'
    ]
  end

  def teardown; end

  def test_input
    assert_equal @tags, HexletCode::Input.new(:name, {}, @model).build
  end
end
