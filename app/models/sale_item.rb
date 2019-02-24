class SaleItem < ApplicationRecord
	validates :name, presence: true
	validates :value, presence: true
	validates :quantity, presence: true


	def nil_fields?
		self.name.nil? || self.value.nil? || self.quantity.nil?
	end

end
