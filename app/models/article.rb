class Article < ApplicationRecord
   include TimeConcern 
   has_many :comments, dependent: :destroy
   belongs_to :user
   validates :title,presence: true
   validates :body,presence: true,length: {maximum: 10}
end



