module FatSecret
  module FoodDiary
    def self.entries_for_day(user, date: Date.today)
      query = {
        method: 'food_entries.get',
        oauth_token: user.fat_secret_auth_token,
        oauth_secret: user.fat_secret_auth_secret,
        date: FatSecret.days_since_epoch(date)
      }
      r = FatSecret.get(query).deep_symbolize_keys
      return [] if r[:food_entries].blank? || r[:food_entries][:food_entry].blank?
      
      # FatSecret only returns an array if there is >1 food entry.... LAME.
      if r[:food_entries][:food_entry].kind_of? Hash
        [r[:food_entries][:food_entry]]
      else
        r[:food_entries][:food_entry]
      end
    end

    def self.entries_for_month(user, date: Date.today)
      query = {
        method: 'food_entries.get_month',
        oauth_token: user.fat_secret_auth_token,
        oauth_secret: user.fat_secret_auth_secret,
        date: FatSecret.days_since_epoch(date)
      }
      FatSecret.get(query).
        deep_symbolize_keys[:month].
        try(:fetch, :day) || []
    end

    def self.edit_entry(user, options={})
      query = {
        method: 'food_entry.edit',
        oauth_token: user.fat_secret_auth_token,
        oauth_secret: user.fat_secret_auth_secret,
      }
      FatSecret.get(query.merge(options))
    end

    def self.nutrient_fields
      [:calories, :carbohydrate, :protein, :fat, :saturated_fat, 
       :polyunsaturated_fat, :monounsaturated_fat, :trans_fat, :cholesterol, 
       :sodium, :potassium, :fiber, :sugar, :vitamin_a, :vitamin_c, 
       :calcium, :iron]
    end
  end
end
