module FatSecret
  module Profile
    def self.create
      query = {
        method: 'profile.create'
      }
      FatSecret.get(query)
    end
    
    def self.get(oauth_token, oauth_secret)
      query = {
        method: 'profile.get',
        oauth_token: oauth_token,
        oauth_secret: oauth_secret
      }
      FatSecret.get(query)
    end
    
    def self.get_auth(user_id)
      query = {
        method: 'profile.get_auth',
        user_id: user_id
      }
      FatSecret.get(query)
    end
    
    def self.script_session_key(oauth_token, oauth_secret, cookie:'true')
      query = {
        method: 'profile.request_script_session_key',
        oauth_token: oauth_token,
        oauth_secret: oauth_secret,
        cookie: cookie
      }
      FatSecret.get(query)
    end
  end
end