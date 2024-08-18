class User < ApplicationRecord
  devise :database_authenticatable, :api

  has_many :roles
  has_many :projects, through: :roles
end
