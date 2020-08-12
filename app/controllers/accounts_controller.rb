class AccountsController < ApplicationController
    
    def index
        if current_customer
            @accounts = Account.where(customer_id: current_customer["id"])
        elsif current_driver    
            @accounts = Account.where(driver_id: current_driver["id"])
        end
    end


    def new
        if current_customer
            @account_customer = Customer.find(current_customer["id"]).accounts.build
        elsif current_driver 
            @account_driver = Driver.find(current_driver["id"]).accounts.build
        end
    end
#ここら辺がうまくいくか試してみる
    def create
        if current_customer
            @account = Customer.find(current_customer["id"]).accounts.build(account_params)
        else 
            @account = Driver.find(current_driver["id"]).accounts.build(account_params)
        end
        if @account.save
            redirect_to root_url
        else
            render :new
        end
    end


    private

    def account_params
        # binding.pry
        unless current_customer && Account.where(customer_id: current_customer["id"]).present? 
            unless current_driver && Account.where(driver_id: current_driver["id"]).present?
                params.require(:account).permit(:got).merge(state: params[:account][:got])
            end
        else
            # binding.pry
            params.require(:account).permit(:got).merge(state: params[:account][:got] + Account.where(customer_id: current_customer["id"]).last.state)
        end
    end
end
