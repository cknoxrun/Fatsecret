require 'spec_helper'

describe FatSecret do
  
  let(:client) { FatSecret }
  
  describe 'create_profile' do
    
    before do
     stub_get('profile.create').
       to_return(:body => fixture('create_profile.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.create_profile
      a_get('profile.create').
        should have_been_made
    end
    
  end
  
  describe 'profile' do
    
    before do
     stub_get('profile.get').
       to_return(:body => fixture('profile.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.profile('3f57f9258ce64e3f8a55901a747b1370', '2e0324082acb4979950a8e8071f33c7a')
      a_get('profile.get').
        should have_been_made
    end
    
  end
  
  describe 'get_auth' do
    
    before do
     stub_get('profile.get_auth').
       to_return(:body => fixture('get_auth.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end
    
    it 'requests the correct resource' do
      client.get_auth(1)
      a_get('profile.get_auth').
        should have_been_made
    end
    
  end

  describe 'script_session_key' do
    before do
     stub_get('profile.request_script_session_key').
       to_return(:body => fixture('script_session_key.json'), :headers => {:content_type => 'application/json; charset=utf-8'})
    end

    it 'requests the correct resource' do
      client.script_session_key('3f57f9258ce64e3f8a55901a747b1370', '2e0324082acb4979950a8e8071f33c7a')
      a_get('profile.request_script_session_key').
        should have_been_made
    end
  end
  
end
