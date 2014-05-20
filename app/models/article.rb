class Article < ActiveRecord::Base

  has_many :comments,
  dependent: :destroy
  validates :title, presence: true,
                    length: {minimum: 3},
                    length: {maximum: 20}

  validates :text, presence: true,
                    length: {maximum: 50}


end
