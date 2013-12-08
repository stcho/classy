class Feed < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :topic
  belongs_to :user
  validates :text, presence: true, length: { maximum: 200 }
end
