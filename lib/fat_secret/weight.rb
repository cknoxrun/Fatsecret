module FatSecret
  module Weight
    def self.update(oauth_token, oauth_secret, current_weight_kg, options={})
      query = {
        method: 'weight.update',
        oauth_token: oauth_token,
        oauth_secret: oauth_secret,
        current_weight_kg: current_weight_kg
      }
      FatSecret.get(query.merge(options))
    end
    
    def self.month_weights(oauth_token, oauth_secret, date=nil)
      query = {
        method: 'weights.get_month',
        oauth_token: oauth_token,
        oauth_secret: oauth_secret,
        date: date
      }
      FatSecret.get(query)
    end
  end
end