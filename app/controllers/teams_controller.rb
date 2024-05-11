class TeamsController < ApplicationController
  # クエリストリングが存在する場合、特定の条件で絞り込む
  # 特定のユーザーを含むチーム群を取得する
  # 特定のキーワードを含むチーム群を取得する
  # 特定のユーザーを含み、かつ特定のキーワードを含むチーム群を取得
  def index
    teams = Team.all
    teams = teams.where("name like ?", "%#{params[:search_keyword]}%") if params[:search_keyword]
    teams = teams.joins(:users).merge(User.where(id: params[:user_ids])) if params[:user_ids]
    teams = teams.distinct

    # このタイミングでクエリが実行される
    render json: teams, root: "teams", adapter: :json, status: :ok
  end
end
