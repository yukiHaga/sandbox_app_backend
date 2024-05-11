module Teams
  class UsersController < ApplicationController
    def index
      team = Team.find(params[:team_id])
      render json: team.users, root: "users", adapter: :json, status: :ok
    end
  end
end