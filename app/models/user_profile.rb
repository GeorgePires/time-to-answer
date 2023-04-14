# frozen_string_literal: true

class UserProfile < ApplicationRecord
  extend Enumerize

  belongs_to :user

  enumerize :gender, in: %i[female male non_binary i_prefer_not_to_inform]
end
