class List < ActiveRecord::Base
  has_many :todos, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
end
