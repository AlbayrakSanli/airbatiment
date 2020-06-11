class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :houses
  has_many :appointments
  has_many :users, through: :appointments

  # validates :first_name, :last_name, :description,
  #           presence: true

end
