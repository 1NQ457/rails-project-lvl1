# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def setup
    @single_tag = '<br>'
    @single_tag_with_attr = '<img src="path/to/image">'
    @single_tag_with_empty_attr = '<option selected>'
    @pair_tag = '<label>Email</label>'
    @pair_tag_with_attr = '<label for="email">Email</label>'
    @pair_tag_with_empty_body = '<label></label>'
  end

  def teardown; end

  def test_single_tag
    assert_equal @single_tag, HexletCode::Tag.build('br')
    assert_equal @single_tag_with_attr, HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal @single_tag_with_empty_attr, HexletCode::Tag.build('option', selected: nil)
  end

  def test_pair_tag
    assert_equal @pair_tag, HexletCode::Tag.build('label') { 'Email' }
    assert_equal @pair_tag_with_attr, HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal @pair_tag_with_empty_body, HexletCode::Tag.build('label') { '' }
  end
end
