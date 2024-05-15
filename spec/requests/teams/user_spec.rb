RSpec.describe "/teams", type: :request do
  # GET /teamsについてのリクエストした際のテストを書くよ〜
  describe "GET /teams" do
    subject { get teams_path, headers: headers }

    let(:user1) { create(:user, email: "user1@gmail.com")}
    let(:user2) { create(:user, email: "user2@gmail.com")}
    let(:user3) { create(:user, email: "user3@gmail.com")}
    let(:headers) do
      {
        "ACCEPT" => "application/json",
        "CONTENT_TYPE" => "application/json",
      }
    end

    let(:team1_id) { create(:team, name: "team1").id }
    let(:team2_id) { create(:team, name: "team2").id }
    let(:team3_id) { create(:team, name: "team3").id }

    before do
      create(:user_team, team_id: team1_id, user_id: user1.id)
      create(:user_team, team_id: team1_id, user_id: user2.id)
      create(:user_team, team_id: team1_id, user_id: user3.id)
      create(:user_team, team_id: team2_id, user_id: user1.id)
      create(:user_team, team_id: team2_id, user_id: user2.id)
      create(:user_team, team_id: team3_id, user_id: user3.id)
    end

    it "returns ok" do
      subject
      expect(response).to have_http_status(:ok)
      expect(response.body).to be_json_including({
        teams: have_attributes(size: 3),
      })
      assert_response_schema_confirm(200)
    end

    context "pathにクエリストリングが指定されている場合" do
      context "search_keywordが指定されている場合" do
        subject { get teams_path(search_keyword:), headers: headers }

        let(:search_keyword) { "team4" }

        before do
          create(:team, name: "team4")
        end

        it "returns ok" do
          subject
          expect(response).to have_http_status(:ok)
          expect(response.body).to be_json_including({
            teams: have_attributes(size: 1),
          })
          expect(response.body).to be_json_including({
            teams: [{ name: "team4" }]
          })
          assert_response_schema_confirm(200)
        end
      end

      context "user_idsが指定されている場合" do
        subject { get teams_path(user_ids:), headers: headers }

        let(:user_ids) { [user1.id, user3.id] }

        it "returns ok" do
          subject
          expect(response).to have_http_status(:ok)
          expect(response.body).to be_json_including({
            teams: have_attributes(size: 3),
          })
          expect(response.body).to be_json_including({
            teams: [
              { name: "team1" },
              { name: "team2" },
              { name: "team3" }
            ]
          })
          assert_response_schema_confirm(200)
        end
      end

      context "search_keywordとuser_idsが指定されている場合" do
        subject { get teams_path(user_ids:, search_keyword:), headers: headers }

        let(:user_ids) { [user1.id, user3.id] }
        let(:search_keyword) { "team3" }

        it "returns ok" do
          subject
          expect(response).to have_http_status(:ok)
          expect(response.body).to be_json_including({
            teams: have_attributes(size: 1),
          })
          expect(response.body).to be_json_including({
            teams: [{ name: "team3" }]
          })
          assert_response_schema_confirm(200)
        end
      end
    end
  end
end
