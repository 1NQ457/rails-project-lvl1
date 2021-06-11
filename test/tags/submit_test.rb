# frozen_string_literal: true

require 'test_helper'

class SubmitTest < Minitest::Test
  def setup
    @submit = '<input type="submit" value="Save" name="commit">'
  end

  def teardown; end

  def test_submit
    assert_equal @submit, HexletCode::Submit.new.build
  end
end
