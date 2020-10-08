class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :start_at
    validates :start_time
    validates :enviroment_id, numericality: { other_than: 1 }
    validates :place
    validates :explanation
    validates :user_id
  end

  belongs_to :user
  has_many :likes, dependent: :destroy

  def liked_by?(user, event)
    Like.where(user_id: user.id, event_id: event.id).exists?
  end
end
