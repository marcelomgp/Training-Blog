class Comment < ActiveRecord::Base
  belongs_to :article

  validates :commenter, presence: true,
                    length: {minimum: 3},
                    length: {maximum: 20}

  validates :body, presence: true,
                    length: {maximum: 100}

end
