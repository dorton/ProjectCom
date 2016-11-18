class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :messages
  has_many :comments
  ROLES = %w[admin client].freeze


  def name
    "#{first_name} #{last_name}"
  end
end
