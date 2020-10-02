class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_NAME_FURIGANA_REGEX = /\A[ァ-ン]+\z/.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password,
              format: { with: VALID_PASSWORD_REGEX }

    validates :nickname, presence: true

    validates :family_name,
              format: { with: VALID_NAME_REGEX }

    validates :first_name,
              format: { with: VALID_NAME_REGEX }

    validates :family_name_furigana,
              format: { with: VALID_NAME_FURIGANA_REGEX }

    validates :first_name_furigana,
              format: { with: VALID_NAME_FURIGANA_REGEX }

    validates :birthday
  end

  has_many :items
end
