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
end
