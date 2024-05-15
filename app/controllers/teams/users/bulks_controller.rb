module Teams
  module Users
    class BulksController < ApplicationController
      def update
        team = Team.find(params[:team_id])
        user_ids = update_params[:users].map { |user| user[:id] }
        users = team.users.where(id: user_ids)

        # フロントで返したユーザーを使いわないなら、ユーザーを返す必要がないなら、okだけ返しとく
        head :ok
      end

      def update_params
        params.permit(users: %i[id first_name])
      end
    end
  end
end
