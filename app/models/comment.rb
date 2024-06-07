class Comment < ApplicationRecord
  include TimeConcern 
  belongs_to :article
  belongs_to :user
  
end
