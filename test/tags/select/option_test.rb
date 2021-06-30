# frozen_string_literal: true

require 'test_helper'

class OptionTest < Minitest::Test
  def setup
    @unselected_option = '<option value="f">f</option>'
    @selected_option = '<option value="m" selected>m</option>'
  end

  def teardown; end

  def test_unselected_option
    assert_equal @unselected_option, HexletCode::Option.new('f', 'm').build
  end

  def test_selected_option
    assert_equal @selected_option, HexletCode::Option.new('m', 'm').build
  end
end
