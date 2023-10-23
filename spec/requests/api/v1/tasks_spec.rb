# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Task API', :request do
  describe 'GET api/v1/tasks' do
    let!(:user)  { create :user}
    let!(:task)  { create :task, user: user }

    let(:auth_parsed_body) { JSON.parse(response.body) }

    it 'return tasks from user' do
      post '/api/auth/login', params:{ email: user.email, password: user.password }

      get '/api/v1/tasks', headers: {
        'Accept' => 'application/vnd.api+json; version=1',
        'Content-Type' => 'application/json',
        'Authorization' => auth_parsed_body["token"]
      }

      response_json = JSON.parse(response.body)

      expect(response).to be_ok
    end
  end

  describe 'POST api/v1/tasks' do
    let!(:user)  { create :user}
    let!(:task)  { create :task, user: user }

    let(:auth_parsed_body) { JSON.parse(response.body) }

    let(:task_params) { { task: { title: 'Test' } } }

    it 'return tasks from user' do
      post '/api/auth/login', params:{ email: user.email, password: user.password }

      post '/api/v1/tasks',
      params: task_params,
      headers: {
        'Authorization' => auth_parsed_body["token"]
      }

      response_json = JSON.parse(response.body)

      expect(response.status).to be 201
    end
  end

  describe 'PUT api/v1/tasks/:id' do
    let!(:user)  { create :user}
    let!(:task)  { create :task, user: user }

    let(:auth_parsed_body) { JSON.parse(response.body) }

    let(:task_params) { { task: { title: 'Test' } } }

    it 'return tasks from user' do
      post '/api/auth/login', params:{ email: user.email, password: user.password }

      put api_v1_task_path(task.id),
      params: task_params,
      headers: {
        'Authorization' => auth_parsed_body["token"]
      }

      response_json = JSON.parse(response.body)

      expect(response.status).to be 200
    end
  end

  describe 'DELETE api/v1/tasks/:id' do
    let!(:user)  { create :user}
    let!(:task)  { create :task, user: user }

    let(:auth_parsed_body) { JSON.parse(response.body) }

    let(:task_params) { { task: { title: 'Test' } } }

    it 'return tasks from user' do
      post '/api/auth/login', params:{ email: user.email, password: user.password }

      delete api_v1_task_path(task.id),
      headers: {
        'Authorization' => auth_parsed_body["token"]
      }

      expect(response.status).to be 204
    end
  end
end
