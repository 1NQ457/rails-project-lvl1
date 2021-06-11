# frozen_string_literal: true

module HexletCode
  # Tag Builder
  class Input
    def initialize(user, attribute, options)
      @user = user
      @attribute = attribute
      @options = options
    end

    attr_accessor :user, :attribute, :options

    def build
      value = user[attribute]
      class_name = options[:class]
      if options[:as] == :text
        HexletCode::Tag.build('textarea', class: class_name,
                                          cols: options[:cols] || '20',
                                          rows: options[:rows] || '40',
                                          name: attribute) { value }
      else
        HexletCode::Tag.build('input', class: class_name, type: 'text', name: attribute, value: value)
      end
    end

    def generate_textarea(attribute, options)
      name = 'textarea'
      attributes = {
        class: options[:class],
        cols: options[:cols] || '20',
        rows: options[:rows] || '40',
        name: attribute
      }
      body = user[attribute]
      HexletCode::Input.new(name, attributes, body)
    end

    def generate_input(attribute, options)
      name = 'input',
             attributes = {
               class: options[:class],
               type: 'text',
               value: user[attribute],
               name: attribute
             }
      HexletCode::Input.new(name, attributes)
    end
  end
end
