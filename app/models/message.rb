class Message < ActiveRecord::Base
    # Name is required; under 20 chars
    validates :name , length: { maximum: 20 } , presence: true
    # Message is required; between 2 and 30 chars
    validates :body , length: {minimum: 2 , maximum: 30 } , presence: true
    # Age is required; positive number
    validates :age , presence: true , numericality: { greater_than_or_equal_to: 0 }
end
