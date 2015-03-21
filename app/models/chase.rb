class Chase < ActiveRecord::Base
  has_many :obstacles, dependent: :destroy
end
