class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  has_many :employee_routes
  has_many :routes, through: :employee_routes
  has_many :work_orders, through: :routes
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :email, :phone, :encrypted_password, {presence: true}
  validates :email, uniqueness: true

end
