class DeliveryRequestsController < ApplicationController
    
    def index
        @requests = DeliveryRequest.all
    end
    
    def new
        @request = Customer.find(current_customer["id"]).delivery_requests.build
    end

    def create
        @request = DeliveryRequest.find(current_customer["id"]).delivery_requests.build(request_params)
        if @request.save
            redirect_to root_url
        else
            render :new
        end
    end

    def update
        @request = DeliveryRequest.find(params[:id])
        if @request.update(request_params)
            redirect_to root_url
        else
            render :index
        end
    end



    private
    def request_params
        params.require(:delivery_request).permit(:departure, :destination, :cost, :status)
    end
end
