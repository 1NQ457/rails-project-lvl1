# frozen_string_literal: true

require 'test_helper'

class TextareaTest < Minitest::Test
  def setup
    @textarea = ['<label for="job">Job</label>', '<textarea cols="20" rows="40" name="job">hexlet</textarea>']
    @attributes = {
      class: nil,
      cols: '20',
      rows: '40',
      name: 'job'
    }
    @label = HexletCode::Label.new('job')
  end

  def teardown; end

  def test_textarea
    assert_equal @textarea, HexletCode::Textarea.new(@attributes, 'hexlet', @label).build
  end
end
