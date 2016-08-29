class ZipLocation < ActiveRecord::Base
    has_many :purchase_positions
end