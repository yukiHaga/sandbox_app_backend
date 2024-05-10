module Teams
  class UsersController < ApplicationController
    def index
      team = Team.find(params[:team_id])
      render json: { users: team.users }, status: :ok
    end
  end
end