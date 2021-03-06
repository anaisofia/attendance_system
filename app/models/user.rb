class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_one_attached :avatar
  has_many :lessons
  has_many :lesson_statuses
  has_many :courses, :through => :lessons
  has_many :attendances

  enum role: [:admin, :office, :teacher, :student]

end
