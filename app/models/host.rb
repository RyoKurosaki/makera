class Host < ActiveRecord::Base
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true

  has_many :listings, foreign_key: :host_id, primary_key: :host_id
end
