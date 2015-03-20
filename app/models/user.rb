class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Devise confirms: 
  #                 email: uniqueness, presence, and  validity
  #                 password: presence, confirmation, length
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include RoleModel

  has_many :links, dependent: :destroy
  has_many :one_time_pads, dependent: :destroy
  has_many :reverse_date_cyphers, dependent: :destroy
  
  #password stuff / account setup
  attr_accessor :password, :salt
  validates :password, :confirmation => true #password_confirmation attr
  before_save :encrypt_password
  before_save :set_roles_mask
  after_save :clear_password

  #role model
  roles_attribute :roles_mask
  roles :admin, :client

  private

  def encrypt_password
    if self.password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(self.password, self.salt)
    end
  end

  def clear_password
    self.salt = nil
    self.password = nil
  end

  def set_roles_mask
    #only one role presently
    self.roles = [:client]
  end
end
