class Sale < ApplicationRecord
	has_many :sale_items

	validates :consumer_name, presence: true

	def nil_fields?
		self.consumer_name.nil?
	end

end
