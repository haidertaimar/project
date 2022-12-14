class Blog < ApplicationRecord
    has_rich_text :detials
    has_many :comment,dependent: :destroy
    belongs_to :user
    validates :title, presence: true, length: { minimum: 5 }
    validates :detials ,presence: true,length: {minimum:10}

end
