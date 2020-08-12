class Account < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :driver, optional: true
end
