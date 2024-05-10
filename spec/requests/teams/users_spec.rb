RSpec.describe "/teams/:id/users", type: :request do
  # GET /api/authorsについてのリクエストした際のテストを書くよ〜
  describe "GET /teams/:id/users" do
    subject { get team_users_path(team_id), headers: headers }

    let(:user1) { create(:user, email: "user1@gmail.com")}
    let(:user2) { create(:user, email: "user2@gmail.com")}
    let(:user3) { create(:user, email: "user3@gmail.com")}
    let(:headers) do
      {
        "ACCEPT" => "application/json",
        "CONTENT_TYPE" => "application/json",
      }
    end

    context "teamのidが指定されている場合" do
      let (:team_id) { create(:team).id }

      before do
        create(:user_team, team_id:, user_id: user1.id)
        create(:user_team, team_id:, user_id: user2.id)
        create(:user_team, team_id:, user_id: user3.id)
      end

      context "teamのidと一致するユーザーが存在する場合" do
        fit "returns ok" do
          subject
          expect(response).to have_http_status(:ok)
          expect(response.body).to be_json_including({
            users: have_attributes(size: 3),
          })
          assert_response_schema_confirm(200)
        end
      end

      context "teamのidと一致するユーザーが存在しない場合" do
        it "returns not found" do
        end
      end
    end

    context "teamのidが指定されていない場合" do
      it "returns bad request" do
      end
    end
  end
end
