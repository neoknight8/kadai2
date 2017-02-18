class Response < ApplicationRecord
  belongs_to :micropost
  validates :response_text, presence: true 
  attr_accessor :user
end
