class PagesController < ApplicationController

    def index
        if current_customer
            @request = DeliveryRequest.where(customer_id: current_customer["id"])
        elsif current_driver && current_driver.customer_people.last
            @request = DeliveryRequest.where(customer_id: current_driver.customer_people.last.id)
        end
        
    end
end
