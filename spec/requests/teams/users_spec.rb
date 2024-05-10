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

    let(:team1_id) { create(:team).id }

    before do
      create(:user_team, team_id: team1_id, user_id: user1.id)
      create(:user_team, team_id: team1_id, user_id: user2.id)
      create(:user_team, team_id: team1_id, user_id: user3.id)
    end

    context "teamのidが指定されている場合" do
      context "指定したidと一致するteamが存在する場合" do
        let(:team_id) { team1_id }

        it "returns ok" do
          subject
          expect(response).to have_http_status(:ok)
          expect(response.body).to be_json_including({
            users: have_attributes(size: 3),
          })
          assert_response_schema_confirm(200)
        end
      end

      context "指定したidと一致するteamが存在しない場合" do
        let(:team_id) { 0 }

        it "returns not found" do
          subject
          expect(response).to have_http_status(:not_found)
          assert_response_schema_confirm(404)
        end
      end
    end
  end
end
