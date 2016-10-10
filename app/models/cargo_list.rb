class CargoList < ActiveRecord::Base
    belongs_to :shipper
    has_many :pallets
end