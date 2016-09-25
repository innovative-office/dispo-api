class Variant < ActiveRecord::Base
    belongs_to :purchase_position, primary_key: 'baan_id', foreign_key: 'purchase_position_id'
    belongs_to :purchase_order, primary_key: 'baan_id', foreign_key: 'purchase_order_id'
end