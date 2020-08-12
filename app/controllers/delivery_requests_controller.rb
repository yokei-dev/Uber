class DeliveryRequestsController < ApplicationController
    
    before_action :authenticate_customer!, only: [:new, :create]
    before_action :authenticate_driver!, only: [:index, :create]

    def index
        @requests = DeliveryRequest.all
    end
    
    def new
        @request = Customer.find(current_customer["id"]).delivery_requests.build
    end

    def show
        if current_customer
            @request = DeliveryRequest.where(customer_id: current_customer["id"]).last
        elsif current_driver
            @request = DeliveryRequest.where(customer_id: current_driver.customer_people.last.id).last
        end
    end

    def create
        @request = Customer.find(current_customer["id"]).delivery_requests.build(request_params)
        if @request.save
            redirect_to root_url
        else
            render :new
        end
    end

    def update
        # byebug
        @request = DeliveryRequest.find(params[:id])
        # binding.pry
        if params[:delivery_request][:status] == "1" #ここがおかしい。まだ、値が更新されていないので、0のままパラメータの値によって、場合できるか調べてみる
            @relationship = Driver.find(current_driver["id"]).relationships.build(customer_id: @request.customer_id)
            # @relationship.cost = @request.cost
            if @request.update(request_params) && @relationship.save
                redirect_to root_url
            else
                render :index
            end
        elsif params[:delivery_request][:status] == "3"
            if @request.update(request_params)
                redirect_to root_url
            else
                render @request
            end
        else
            render @request
        end
    end



    private
    def request_params
        params.require(:delivery_request).permit(:departure, :destination, :cost, :status)
    end
end
