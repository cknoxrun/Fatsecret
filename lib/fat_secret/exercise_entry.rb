module FatSecret
  module ExerciseEntry
    def self.get_entries(oauth_token, oauth_secret, options={})
      query = {
        method: 'exercise_entries.get',
        oauth_token: oauth_token,
        oauth_secret: oauth_secret
      }
      FatSecret.get(query.merge(options))
    end

    def self.edit_entry(oauth_token, oauth_secret, options={})
      query = {
        method: 'exercise_entry.edit',
        oauth_token: oauth_token,
        oauth_secret: oauth_secret
      }
      FatSecret.get(query.merge(options))
    end
  end
end
