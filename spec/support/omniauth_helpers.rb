# rubocop:disable all

module OmniauthHelpers
  def mock_auth_hash
    OmniAuth.config.mock_auth[:github] = {
      'provider' => 'github',
      'uid' => '1285456',
      'info' => {
        'nickname' => 'adoug',
        'email' => 'adouglas@example.com',
        'name' => 'Aditya Douglas',
        'image' => 'https://static.thenounproject.com/png/340719-200.png'
      },
      'credentials' => {
        'token' => 'e596f957145e7b9c14',
        'expires' => 'false'
      }
    }
  end

  def omniauth_request
    {"provider"=>"github",
     "uid"=>"62676321",
     "info"=>
      {"nickname"=>"taphill",
       "email"=>nil,
       "name"=>"Taylor Phillips",
       "image"=>"https://avatars2.githubusercontent.com/u/62676321?v=4",
       "urls"=>{"GitHub"=>"https://github.com/taphill", "Blog"=>""}},
     "credentials"=>{"token"=>"8b9a4b79092d9207c9272fe596f957145e7b9c14", "expires"=>false},
     "extra"=>
      {"raw_info"=>
        {"login"=>"taphill",
         "id"=>62676321,
         "node_id"=>"MDQ6VXNlcjYyNjc2MzIx",
         "avatar_url"=>"https://avatars2.githubusercontent.com/u/62676321?v=4",
         "gravatar_id"=>"",
         "url"=>"https://api.github.com/users/taphill",
         "html_url"=>"https://github.com/taphill",
         "followers_url"=>"https://api.github.com/users/taphill/followers",
         "following_url"=>"https://api.github.com/users/taphill/following{/other_user}",
         "gists_url"=>"https://api.github.com/users/taphill/gists{/gist_id}",
         "starred_url"=>"https://api.github.com/users/taphill/starred{/owner}{/repo}",
         "subscriptions_url"=>"https://api.github.com/users/taphill/subscriptions",
         "organizations_url"=>"https://api.github.com/users/taphill/orgs",
         "repos_url"=>"https://api.github.com/users/taphill/repos",
         "events_url"=>"https://api.github.com/users/taphill/events{/privacy}",
         "received_events_url"=>"https://api.github.com/users/taphill/received_events",
         "type"=>"User",
         "site_admin"=>false,
         "name"=>"Taylor Phillips",
         "company"=>"Student @turingschool",
         "blog"=>"",
         "location"=>"Nashville, TN",
         "email"=>nil,
         "hireable"=>nil,
         "bio"=>nil,
         "twitter_username"=>nil,
         "public_repos"=>37,
         "public_gists"=>3,
         "followers"=>4,
         "following"=>4,
         "created_at"=>"2020-03-25T22:56:59Z",
         "updated_at"=>"2020-11-28T17:10:04Z"},
       "all_emails"=>[],
       "scope"=>""}}
  end
end
