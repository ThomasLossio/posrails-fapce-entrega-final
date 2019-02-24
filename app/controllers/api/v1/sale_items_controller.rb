class Api::V1::SaleItemsController < ApplicationController
	before_action :find_saleItems, only: [:show, :update, :destroy]

	def index
		saleItems = SaleItem.where sale_id: params[:sale_id]

		render json: saleItems, status: :ok
	end	

	def create
		saleItem = SaleItem.new (saleItems_params)

		if saleItem.save
			render json: saleItem, status: :created and return
		elsif saleItem.nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Sale Item not saved', errors: saleItem.errors}, status: error_status
	end

	private
	def find_saleItems
		@saleItem = SaleItem.find_by_id(params[:id])
	end

	def saleItems_params
		params.permit(:name, :value, :quantity, :sale_id)
	end
end
