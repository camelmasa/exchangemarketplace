module Exchangemarketplace
  class Client
    URL = "https://exchangemarketplace.com"

    attr_reader :last_response

    def shops(page: 1)
      @last_response = client.get "/shops.json", page: page
      @last_response.body["shops"].map do |shop|
        shop_record = shop["shopifyShopRecord"]

        record = Record.new(
          average_monthly_revenue: shop_record["averageMonthlyRevenue"],
          average_monthly_traffic: shop_record["averageMonthlyTraffic"]
        )

        Shop.new(
          id:                       shop["id"],
          title:                    shop["title"],
          price:                    shop["salePrice"],
          handle:                   shop["handle"],
          sold:                     shop["sold"],
          inventory_value:          shop["inventoryValue"],
          average_profit_per_month: shop["averageProfitPerMonth"],
          contest:                  shop["isContest"],
          private:                  shop["isPrivate"],
          starter_shop:             shop["starterShop"],
          shop_domain:              shop["shopDomain"],
          overall_profit_margins:   shop["overallProfitMargins"],
          record:                   record
        )
      end
    end

    private

    def client
      @client ||= Faraday.new(url: URL) do |conn|
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
