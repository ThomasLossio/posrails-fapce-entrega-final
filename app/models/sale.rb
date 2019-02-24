class Sale < ApplicationRecord
	has_many :sale_items

	validates :consumerName, presence: true

	def nil_fields?
		self.consumerName.nil?
	end

end
