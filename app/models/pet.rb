class Pet < ApplicationRecord
       belongs_to :client
       has_many :pet_histories, dependent: :destroy
end
