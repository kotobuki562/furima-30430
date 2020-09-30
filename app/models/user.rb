class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_NAME_FURIGANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  validates :family_name, presence: true,
                          format: { with: VALID_NAME_REGEX }

  validates :first_name, presence: true,
                         format: { with: VALID_NAME_REGEX }

  validates :family_name_furigana, presence: true,
                                   format: { with: VALID_NAME_FURIGANA_REGEX }

  validates :first_name_furigana, presence: true,
                                  format: { with: VALID_NAME_FURIGANA_REGEX }

  validates :birthday, presence: true
end
