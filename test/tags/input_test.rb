# frozen_string_literal: true

require 'test_helper'

class InputTest < Minitest::Test
  def setup
    @structure = Struct.new(:name, :job, keyword_init: true)
    @user = @structure.new name: 'rob', job: 'hexlet'
    @input = '<input type="text" name="name" value="rob">'
    @textarea = '<textarea cols="20" rows="40" name="job">hexlet</textarea>'
  end

  def teardown; end

  def test_input
    assert_equal @input, HexletCode::Input.new(@user, :name, {}).build
  end

  def test_textarea
    assert_equal @textarea, HexletCode::Input.new(@user, :job, { as: :text }).build
  end
end
