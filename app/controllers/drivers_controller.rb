class DriversController < ApplicationController

    before_action :authenticate_driver!, only: [:show]

    def show
        @customers = current_driver.customer_people
    end
end
