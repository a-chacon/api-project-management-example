require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = FactoryBot.create(:project)
    @token = FactoryBot.create(:devise_api_token).access_token
  end

  test 'should get index' do
    get projects_url, headers: { Authorization: "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url, headers: { Authorization: "Bearer #{@token}" },
                         params: { project: { description: @project.description, name: @project.name } }, as: :json
    end

    assert_response :created
  end

  test 'should show project' do
    get project_url(@project), headers: { Authorization: "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project), headers: { Authorization: "Bearer #{@token}" }, params: { project: { description: @project.description, name: @project.name } },
                                 as: :json
    assert_response :success
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project), headers: { Authorization: "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
