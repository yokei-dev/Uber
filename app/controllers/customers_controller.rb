class CustomersController < ApplicationController

    before_action :authenticate_customer!, only: [:show]


    def show
        @drivers = current_customer.driver_people
    end

    def account_new
        @account = Customer.find(current_customer["id"]).accounts.build
        @request = DeliveryRequest.where(customer_id: current_customer["id"]).last
    end

    def account_create
        @customer_account = Customer.find(current_customer["id"]).accounts.build(customer_account_params)
        @driver = Customer.find(current_customer["id"]).driver_people.last
        @driver_account = @driver.accounts.build(driver_account_params(@driver))
        @request = DeliveryRequest.where(customer_id: current_customer["id"]).last
        @relationship = Relationship.where(customer_id: current_customer["id"], driver_id: @driver.id).last
        @relationship.cost = @request.cost
        # binding.pry
        if @customer_account.save && @driver_account.save && @request.update(request_params) && @relationship.save
            redirect_to root_url
        else
            render action: :account_new
        end
    end

    private 

    def customer_account_params
        # binding.pry
        params.require(:account).permit(:lost).merge(state: Account.where(customer_id: current_customer["id"]).last.state - params[:account][:lost].to_i)
    end

    def driver_account_params(driver)
        # binding.pry
        params.require(:account).permit(:lost).merge(state: Account.where(driver_id: driver.id).last.state + params[:account][:lost].to_i, got: params[:account][:lost])
    end

    def request_params
        params.require(:delivery_request).permit(:status)
    end
    
end
