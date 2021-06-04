class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable, :recoverable, :rememberable, :validatable#, :registerable

  enum role: %i[user admin]
end
