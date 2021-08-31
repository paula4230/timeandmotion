class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :categories       
  has_many :projects
  has_many :phases


  def first_name
  end

  def last_name
  end

  def employee_id
  end

  def supervisor
  end


end
