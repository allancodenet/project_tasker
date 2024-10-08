class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_one :owned_organization, class_name: "organization", foreign_key: :owner_id, inverse_of: :owner, dependeny: :destroy
  has_many :projects
  has_many :tasks, through: :projects
  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"
  accepts_nested_attributes_for :owned_organization
end
