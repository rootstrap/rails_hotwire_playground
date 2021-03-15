# frozen_string_literal: true

class TittleComponent < ViewComponent::Base
  def initialize(text: nil, css_class: [], **options)
    super
    @text = text
    @css_class = Array(css_class)
    @options = options
  end

  private

  def css_classes
    (base_classes + @css_class).join(' ')
  end

  def base_classes
    %w[text-4xl mb-4 text-center]
  end
end
