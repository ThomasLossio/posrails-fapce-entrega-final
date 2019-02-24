class Api::V1::SalesController < ApplicationController
	before_action :find_sale, only: [:show, :update, :destroy]


	def index
		sales = Sale.all
		render json: sales, status: :ok
	end


	def show
		if @sale.nil?
			render json: {"message": "Sale not found"}, status: :not_found
		else
			render json: @sale, status: :ok
		end
	end

	def create
		sale = Sale.new (sale_params)
		sale.consumerName = params[:consumerName]

		if sale.save
			render json: sale, status: 201 and return
		elsif sale.nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: 'Sale not saved', errors: sale.errors}, status: error_status
			
	end

	
	def update
		if @sale.nil?
			render json: {"message": "Sale not found"}, status: :not_found and return
		end
	end

	def destroy
	
	end

	private
	def find_sale
		@sale = Sale.find_by_id(params[:id])
	end

	def sale_params
		params.permit(:consumerName)
	end
end
