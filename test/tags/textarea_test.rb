# frozen_string_literal: true

require 'test_helper'

class TextareaTest < Minitest::Test
  def setup
    @textarea = ['<label for="job">Job</label>', '<textarea cols="20" rows="40" name="job">hexlet</textarea>']
    @structure = Struct.new(:name, :job, keyword_init: true)
    @model = @structure.new name: 'rob', job: 'hexlet'
  end

  def teardown; end

  def test_textarea
    assert_equal @textarea, HexletCode::Textarea.new(:job, { as: :text }, @model).build
  end
end
