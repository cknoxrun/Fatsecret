module FatSecret
  module Exercise
    def self.get_exercises
      query = {
        method: 'exercises.get'
      }
      FatSecret.get(query)
    end
  end
end