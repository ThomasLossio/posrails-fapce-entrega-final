class Api::V1::SalesController < ApplicationController
	before_action :find_sale, only: [:show, :update, :destroy]


	def index
		sales = Sale.all
		render json: sales, status: :ok
	end


	def show
		if @sale.nil?
			render json: {message: "Sale not found"}, status: :not_found
		else
			render json: @sale, status: :ok
		end
	end

	def create
		sale = Sale.new (sale_params)
		sale.consumer_name = params[:consumer_name]

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
			render json: {message: "Sale not found"}, status: :not_found and return
		end

		@sale.consumer_name = params[:consumer_name]

		if @sale.update (sale_params)
			render json: @sale, status: :ok and return
		elsif @sale.nil_fields?
			error_status = :bad_request
		else
			error_status = :unprocessable_entity
		end

		render json: {message: "Sale not updated", errors: @sale.errors}, status: error_status
			
	end

	def destroy
		if @sale.nil?
			render json: {message: 'Sale not found'}, status: :not_found
		else
			@sale.destroy
		end
	end

	def total_sales
		sales = Sale.all
		arr = []
		consumer_name = [{}]
		
		sales.each do |sale|
			totalValue = 0.0
			sale.sale_items.each do |total|
				totalValue = totalValue + total.value
			end
			consumer_name.push({"consumer_name" => sale.consumer_name, "total": totalValue})		
		end
		
			#consumer_name.push({"consumerName" => sale.consumer_name, "total": sale.sale_items})
		
		render json: consumer_name, status: :ok
	end

	private
	def find_sale
		@sale = Sale.find_by_id(params[:id])
	end

	def sale_params
		params.permit(:consumer_name)
	end
end
