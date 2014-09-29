module FatSecret
  module Recipe
    def self.search(expression, max_results=20)
      query = {
        method: 'recipes.search',
        search_expression: expression.esc,
        max_results: max_results
      }
      FatSecret.get(query)
    end
    
    def self.get(id)
      query = {
        method: 'recipe.get',
        recipe_id: id
      }
      FatSecret.get(query)
    end
  end
end