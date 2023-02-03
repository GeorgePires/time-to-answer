# frozen_string_literal: true

module Home
  module SearchHelper
    def show_keyword(keyword)
      keyword = 'Search' if keyword.nil?
      keyword
    end
  end
end
