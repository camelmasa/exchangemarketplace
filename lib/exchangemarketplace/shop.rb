module Exchangemarketplace
  class Shop
    include Virtus.model(strict: true)

    attribute :id
    attribute :title
    attribute :price
    attribute :handle
    attribute :sold
    attribute :inventory_value
    attribute :average_profit_per_month
    attribute :contest
    attribute :private
    attribute :starter_shop
    attribute :shop_domain
    attribute :overall_profit_margins
    attribute :record

    def sold?
      sold
    end

    def contest?
      contest
    end

    def private?
      self.private
    end

    def starter_shop?
      starter_shop
    end
  end
end
