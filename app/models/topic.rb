class Topic < ActiveRecord::Base
  has_many :feeds, dependent: :destroy
  belongs_to :course
  belongs_to :user
  validates :title, presence: true
end
