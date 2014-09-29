module FatSecret
  module RecipeType
    def recipe_types
      query = {
        method: 'recipe_types.get'
      }
      FatSecret.get(query)
    end
  end
end