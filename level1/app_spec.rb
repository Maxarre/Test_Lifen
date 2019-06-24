# rspec app_spec.rb

require 'rspec'

require_relative './app.rb'

RSpec.describe 'Prices calculator', type: :model do
  let(:data) { JSON.parse(File.read('data.json')) }
  let(:new_output) { JSON.parse(File.read('new_output.json')) }
  let(:output) { JSON.parse(File.read('output.json')) }

  it 'total of first day should be equal to 2.84' do
    expect(new_output['totals'][0]['total']).to eq(2.84)
  end

  it 'total of second day should be equal to 1.47' do
    expect(new_output['totals'][1]['total']).to eq(1.47)
  end

  it 'total of third day should be equal to 0.9' do
    expect(new_output['totals'][2]['total']).to eq(0.9)
  end

  it 'total of fourth day should be equal to 1.82' do
    expect(new_output['totals'][3]['total']).to eq(1.82)
  end

  it 'total of fith day should be equal to 2.1' do
    expect(new_output['totals'][4]['total']).to eq(2.1)
  end

  it 'total of sixth day should be equal to 2.2' do
    expect(new_output['totals'][5]['total']).to eq(2.2)
  end

  it 'new_output should equal output' do
    expect(new_output).to eq(output)
  end
end
