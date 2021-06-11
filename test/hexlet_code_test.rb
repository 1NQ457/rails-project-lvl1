# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    @structure = Struct.new(:name, :job, keyword_init: true)
    @user = @structure.new job: 'hexlet'
    @actual = File.read('test/fixtures/form')
  end

  def teardown; end

  def test_hexlet_code
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal @actual, form
  end
end
