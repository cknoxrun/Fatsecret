module FatSecret
  module FoodDiary
    NUTRIENT_FIELDS = { 
      calories: 'kcal',
      carbohydrate: 'grams',
      protein: 'grams',
      fat: 'grams',
      saturated_fat: 'grams', 
      polyunsaturated_fat: 'grams',
      monounsaturated_fat: 'grams',
      trans_fat: 'grams',
      cholesterol: 'milligrams', 
      sodium: 'milligrams',
      potassium: 'milligrams',
      fiber: 'grams',
      sugar: 'grams',
      vitamin_a: '% DRI',
      vitamin_c: '% DRI', 
      calcium: '% DRI',
      iron: '% DRI'
    }

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
      NUTRIENT_FIELDS.keys
    end

    def self.nutrient_field_units(field)
      raise "invalid field #{field} - no units" if NUTRIENT_FIELDS[field.to_sym].nil?
      NUTRIENT_FIELDS[field.to_sym]
    end
  end
end
