class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :full_name #for full name validation
  has_many :posts

  # def email_required? for disabling required errors from the devise library, search for the errors in yml file?
  #   true
  # end 

  enum role: [:user, :admin]
  after_initialize  :set_default_role, if: :new_record?

  private
    def set_default_role
      self.role ||= :user
    end
    
end
