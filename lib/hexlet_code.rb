# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  class << self
    def form_for(subject, route = '#')
      body = yield if block_given?
      HexletCode::Tag.build('form', action: route, mathod: 'Post') {body ? body : ''}
    end
  end
  # Your code goes here...
end
