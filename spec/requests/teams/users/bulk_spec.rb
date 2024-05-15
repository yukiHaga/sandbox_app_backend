RSpec.describe "/teams/:id/users/bulk", type: :request do
  describe "PATCH /teams/:id/users/bulk" do
    subject { patch team_users_bulk_path(team1_id), params:, headers: }

    let(:params) do
      {
        users: [
          { id: user1.id, first_name: "new_user1" },
          { id: user3.id, first_name: "new_user3" }
        ]
      }.to_json
    end

    let(:headers) do
      {
        "ACCEPT" => "application/json",
        "CONTENT_TYPE" => "application/json",
      }
    end

    let(:user1) { create(:user, first_name: "user1", email: "user1@gmail.com")}
    let(:user2) { create(:user, first_name: "user2", email: "user2@gmail.com")}
    let(:user3) { create(:user, first_name: "user3", email: "user3@gmail.com")}

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

    fit "returns ok" do
      subject
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm(200)
    end
  end
end
