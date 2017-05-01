class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Devise confirms: 
  #                 email: uniqueness, presence, and  validity
  #                 password: presence, confirmation, length
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :links, dependent: :destroy
  has_many :one_time_pads, dependent: :destroy
  has_many :reverse_date_cyphers, dependent: :destroy
  has_many :rot_cyphers, dependent: :destroy
  has_many :v_square_cyphers, dependent: :destroy
  has_many :chases, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :running_keys, dependent: :destroy
  has_many :campaigns, dependent: :destroy
  
  #password stuff / account setup
  attr_accessor :password, :salt
  validates :password, :confirmation => true #password_confirmation attr
  before_save :encrypt_password
  before_save :set_access_role
  
  ACCESS_ROLES = {
                    client:"client"
                 }


  def is_player?(campaign)
    campaign.user_id != self.id?
  end

  def is_gm?(campaign)
    campaign.user_id == self.id?
  end

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

  def set_access_role
    #only one role presently, GM set by console
    self.access_role = :client
  end
end
