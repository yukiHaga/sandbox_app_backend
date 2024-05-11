team_id = Team.pick(:id)
users = User.all

users.each do |user|
  UserTeam.seed(
    {
      user_id: user.id,
      team_id:
    }
  )
end
