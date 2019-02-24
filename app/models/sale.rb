class Sale < ApplicationRecord
	validates :consumerName, presence: true

	def nil_fields?
		self.consumerName.nil?
	end

end
