class Book < ApplicationRecord
	belongs_to :user
	validates :body, length: { maximum: 200}
	validates :title, presence: true
	validates :body, presence: true

	 def user
    return User.find_by(id: self.user_id)
  end
end
