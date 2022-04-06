class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :photos

  validates :title,          presence: true
  validates :live_venue,     presence: true
  validates :artist,         presence: true
  validates :start_time,     presence: true
  validates :ending_time,    presence: true
  validates :start_date,     presence: true
  validates :body,           presence: true

  geocoded_by :live_venue
  after_validation :geocode, if: :live_venue_changed?
  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
