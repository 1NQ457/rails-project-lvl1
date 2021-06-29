# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def self.build(form, route)
      Tag.build('form', action: route, method: 'post') do
        form.inner_tags.each_with_object([]) do |tag, result|
          result.push tag.build
        end.join
      end
    end
  end
end
