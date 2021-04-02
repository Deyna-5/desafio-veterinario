class Client < ApplicationRecord
       has_many :pets, dependent: :destroy
       accepts_nested_attributes_for :pets, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
end
