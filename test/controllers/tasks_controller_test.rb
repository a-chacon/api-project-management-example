require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = FactoryBot.create(:task)
    @project = @task.project

    @token = FactoryBot.create(:devise_api_token).access_token
  end

  test 'should get index' do
    get project_tasks_url(@project), headers: { Authorization: "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should create task' do
    token = FactoryBot.create(:devise_api_token)

    FactoryBot.create(:role, user: token.resource_owner, role: :manager, project: @project)

    assert_difference('Task.count') do
      post project_tasks_url(@project), headers: { Authorization: "Bearer #{token.access_token}" },
                                        params: { task: { description: @task.description, project_id: @task.project_id, status: @task.status, title: @task.title } }, as: :json
    end

    assert_response :created
  end

  test 'should not create task' do
    token = FactoryBot.create(:devise_api_token)

    FactoryBot.create(:role, user: token.resource_owner, role: :contributor, project: @project)

    assert_no_difference('Task.count') do
      post project_tasks_url(@project), headers: { Authorization: "Bearer #{token.access_token}" },
                                        params: { task: { description: @task.description, project_id: @task.project_id, status: @task.status, title: @task.title } }, as: :json
    end

    assert_response :forbidden
  end

  test 'should show task' do
    get task_url(@task), headers: { Authorization: "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test 'should update task' do
    patch task_url(@task), headers: { Authorization: "Bearer #{@token}" },
                           params: { task: { description: @task.description, project_id: @task.project_id, status: @task.status, title: @task.title } }, as: :json
    assert_response :success
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task), headers: { Authorization: "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
