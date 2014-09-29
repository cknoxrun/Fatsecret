module FatSecret
  module Food
    def self.autocomplete(expression, max_results=4)
      query = {
        method: 'foods.autocomplete',
        expression: expression.esc,
        max_results: max_results
      }
      FatSecret.get(query)
    end
    
    def self.id_for_barcode(barcode)
      query = {
        method: 'food.find_id_for_barcode',
        barcode: barcode
      }
      FatSecret.get(query)
    end
    
    def self.search(expression, page_number=0, max_results=20)
      query = {
        method: 'foods.search',
        search_expression: expression.esc,
        page_number: page_number,
        max_results: max_results
      }
      FatSecret.get(query)
    end
    
    def self.get(id)
      query = {
        method: 'food.get',
        food_id: id
      }
      FatSecret.get(query)
    end
  end
end