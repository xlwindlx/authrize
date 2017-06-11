class User < ApplicationRecord
  rolify
  include Authority::UserAbilities
  has_many :posts, dependent: :destroy
  after_create :set_default_role, if: Proc.new { User.count > 1 }
  private
  def set_default_role
    add_role :user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable
end
