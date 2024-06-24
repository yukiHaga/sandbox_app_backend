module Teams
  class UsersController < ApplicationController
    def index
      team = Team.find(params[:team_id])
      # response.headers["Access-Control-Allow-Origin"] = "http://localhost:3003"
      Rails.logger.debug "nextからリクエストきた"

      cookies[:hoge_count] = cookies[:hoge_count] ? cookies[:hoge_count].to_i + 1 : 1
      # response.headers["Set-Cookie"] = "hoge_name=hogeYuki; path=/; expires=Fri, 28 Jun 2024 00:28:20 GMT; SameSite=Lax"

      render json: team.users, root: "users", adapter: :json, status: :ok
    end

    # cors自作用に作ったアクション
    # def option
    #   response.headers["Access-Control-Allow-Methods"] = "GET"
    #   response.headers["Access-Control-Allow-Headers"] = "Content-Type"
    #   response.headers["Access-Control-Allow-Origin"] = "http://localhost:3003"

    #   head :ok
    # end
  end
end
