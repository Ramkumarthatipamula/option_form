class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def current_user
    @user = Model.find_by_id(declared(params)[:user_id])
    @user.present? ? @user : error!({error: "User not found"}, 404)
  end
end
