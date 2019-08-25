class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_one_attached :avatar
  has_many :lesson_status
  has_many :courses, :through => :lessons

  enum role: [:admin, :office, :teacher, :student]
end
