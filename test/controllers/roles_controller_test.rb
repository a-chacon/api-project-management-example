require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = FactoryBot.create(:role)
    @project = @role.project

    @token = FactoryBot.create(:devise_api_token).access_token
  end

  test 'should get index' do
    get project_roles_url(@project), headers: { Authorization: "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should create role' do
    assert_difference('Role.count') do
      post project_roles_url(@project), headers: { Authorization: "Bearer #{@token}" }, params: { role: { project_id: @role.project_id, role: @role.role, user_id: @role.user_id } },
                                        as: :json
    end

    assert_response :created
  end

  test 'should show role' do
    get role_url(@role), headers: { Authorization: "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should update role' do
    patch role_url(@role), headers: { Authorization: "Bearer #{@token}" },
                           params: { role: { project_id: @role.project_id, role: @role.role, user_id: @role.user_id } }, as: :json
    assert_response :success
  end

  test 'should destroy role' do
    assert_difference('Role.count', -1) do
      delete role_url(@role), headers: { Authorization: "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
