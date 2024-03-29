# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank

  validates :first_name, :last_name, presence: true
  validates :first_name, length: { minimum: 3 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
