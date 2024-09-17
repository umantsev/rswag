# frozen_string_literal: true

require 'spec_helper'
require 'rake'

RSpec.describe 'rswag:specs:swaggerize' do
  let(:openapi_root) { Rails.root.join('swagger').to_s }

  before do
    TestApp::Application.load_tasks
    FileUtils.rm_r(openapi_root) if File.exist?(openapi_root)
  end

  it 'generates Swagger JSON files from integration specs' do
    Rake::Task['rswag:specs:swaggerize'].invoke
    expect(File).to exist("#{openapi_root}/v1/swagger.json")
  end
end
