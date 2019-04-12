class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :histories, dependent: :destroy
  has_many :player1_gameloggings, :class_name => "Gamelogging", :foreign_key => :player1_id
  has_many :player2_gameloggings, :class_name => "Gamelogging", :foreign_key => :player2_id

  validates :name, :street, :city, :postal_code, :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def self.search(query)
    q = "%#{query}%"
    self.where('name LIKE :query OR
                email LIKE :query OR
                street LIKE :query OR
                postal_code LIKE :query OR
                city LIKE :query', query: q)
  end

end
