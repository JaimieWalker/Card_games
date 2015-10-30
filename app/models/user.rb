class User < ActiveRecord::Base
  has_secure_password

  belongs_to :game
  #UserCard is actually a hand
  has_many :user_cards
  has_many :cards, through: :user_cards

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  def draw_card(n)
    n.times do
      card = Card.draw
      self.cards << card
    end
  end

  def self.create_dealer
    User.skip_callback(:create)
    dealer = User.new(user_name: "Dealer",dealer: true)
    dealer.save(:validate => false)
    User.set_callback(:create)
    dealer
  end

end
