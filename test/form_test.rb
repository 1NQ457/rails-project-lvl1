# frozen_string_literal: true

require 'test_helper'

class FormTest < Minitest::Test
  def setup
    @structure = Struct.new(:name, :job, keyword_init: true)
    @user = @structure.new job: 'hexlet'
    @actual = File.read('test/fixtures/form')
  end

  def teardown; end

  def test_form
    form = HexletCode::Form.new(@user)
    form.input :name
    form.input :job
    form.submit

    assert_equal @actual, form.build('#')
  end
end
