# frozen_string_literal: true

require 'test_helper'

class SelectTest < Minitest::Test
  def setup
    @structure = Struct.new(:name, :job, :gender, keyword_init: true)
    @model = @structure.new name: 'rob', job: 'hexlet', gender: 'm'
    @tags = [
      '<label for="gender">Gender</label>',
      '<select name="gender"><option value="m" selected>m</option><option value="f">f</option></select>'
    ]
  end

  def teardown; end

  def test_input
    assert_equal @tags, HexletCode::Select.new(:gender, { as: :select, collection: %w[m f] }, @model).build
  end
end
