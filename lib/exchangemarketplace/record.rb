module Exchangemarketplace
  class Record
    include Virtus.model(strict: true)

    attribute :average_monthly_revenue
    attribute :average_monthly_traffic
  end
end
