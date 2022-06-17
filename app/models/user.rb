class User < ApplicationRecord
    validates :name, presence: true, length: {in: 2..50},format: { with: /\A[a-zA-Z]+\z/}
    validates :age, presence: true,numericality: {in: 8..99}
    validates :gender, presence: true

end
