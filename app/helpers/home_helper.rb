# frozen_string_literal: true

module HomeHelper
  def show_keyword(keyword)
    keyword = 'Search' if keyword.nil?
    keyword
  end
end
