# frozen_string_literal: true

require 'test_helper'

class LabelTest < Minitest::Test
  def setup
    @structure = Struct.new(:name, :job, keyword_init: true)
    @user = @structure.new job: 'hexlet'
    @label = '<label for="name">Name</label>'
  end

  def teardown; end

  def test_label
    assert_equal @label, HexletCode::Label.new(:name).build
  end
end
