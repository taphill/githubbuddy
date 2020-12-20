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

  def mock_fake_auth_hash
    OmniAuth.config.mock_auth[:github] = {
      'provider' => 'github',
      'uid' => '9503748',
      'info' => {
        'nickname' => 'abcdefg',
        'email' => 'abcdefg@example.com',
        'name' => 'Alpha Faker',
        'image' => 'https://static.thenounproject.com/png/340719-200.png'
      },
      'credentials' => {
        'token' => 'e596f957145t89n7f8',
        'expires' => 'false'
      }
    }
  end

  def mock_real_auth_hash
    OmniAuth.config.mock_auth[:github] = {
      'provider' => 'github',
      'uid' => '62676321',
      'info' => {
        'nickname' => 'taphill',
        'email' => 'taylorscottphillips@gmail.com',
        'name' => 'Taylor Phillips',
        'image' => 'https://avatars2.githubusercontent.com/u/62676321?v=4'
      },
      'credentials' => {
        'token' => 'e596f957145e7b9c14',
        'expires' => 'false'
      }
    }
  end

  def login_user
    mock_real_auth_hash
    visit root_path
    click_link 'Sign in'
  end

  def login_user_with_no_stars
    mock_fake_auth_hash
    visit root_path
    click_link 'Sign in'
  end
end
