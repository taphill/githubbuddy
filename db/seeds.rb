# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(github_id: 1838750, nickname: 'adoug')
user2 = User.create!(github_id: 84398305, nickname: 'mjones')

repo1 = Repo.create!(github_id: 13807606, name: 'fzf', owner: 'junegunn', url: 'https://github.com/junegunn/fzf', description: ':cherry_blossom: A command-line fuzzy finder')
repo2 = Repo.create!(github_id: 53238813, name: 'brew', owner: 'Homebrew', url: 'https://github.com/Homebrew/brew', description: '🍺 The missing package manager for macOS (or Linux)')
repo3 = Repo.create!(github_id: 53631945, name: 'ripgrep', owner: 'BurntSushi', url: 'https://github.com/BurntSushi/ripgrep', description: 'ripgrep recursively searches directories for a regex pattern while respecting your gitignore')
repo4 = Repo.create!(github_id: 40997482, name: 'vim', owner: 'vim', url: 'https://github.com/vim/vim', description: 'The official Vim repository')
repo5 = Repo.create!(github_id: 51980455, name: 'alacritty', owner: 'alacritty', url: 'https://github.com/alacritty/alacritty', description: 'A cross-platform, GPU-accelerated terminal emulator')

user_repo1 = UserRepo.create!(user_id: user1.id, repo_id: repo1.id)
user_repo2 = UserRepo.create!(user_id: user1.id, repo_id: repo2.id)
user_repo3 = UserRepo.create!(user_id: user1.id, repo_id: repo3.id)
user_repo4 = UserRepo.create!(user_id: user1.id, repo_id: repo4.id)
user_repo5 = UserRepo.create!(user_id: user1.id, repo_id: repo5.id)

user_repo6 = UserRepo.create!(user_id: user2.id, repo_id: repo1.id)
user_repo7 = UserRepo.create!(user_id: user2.id, repo_id: repo2.id)

tag1 = Tag.create(name: 'go')  
tag2 = Tag.create(name: 'terminal')  
tag3 = Tag.create(name: 'rust')  
tag4 = Tag.create(name: 'vim')  

Tagging.create!(tag_id: tag1.id, user_repo_id: user_repo1.id)
Tagging.create!(tag_id: tag2.id, user_repo_id: user_repo1.id)
Tagging.create!(tag_id: tag3.id, user_repo_id: user_repo5.id)
Tagging.create!(tag_id: tag1.id, user_repo_id: user_repo6.id)
