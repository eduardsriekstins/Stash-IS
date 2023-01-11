class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :full_name #for full name validation
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_one_attached :avatar
  validate :validate_file_type

  def validate_file_type
    return unless avatar.attached?
    unless avatar.content_type.in?(%w[image/jpeg image jpg image/png])
      errors.add(:avatars, "Must be a JPEG, JPG or PNG")
    end
  end


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
