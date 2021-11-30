describe 'GET /api/articles' do
  subject { response }

  before do
    get '/api/articles'
  end

  it 'is expected to respond with status 200' do
    expect(subject.status).to eq 200
  end

  it 'is expected to respond with an empyt array' do
    expect(response_json).to eq []  
  end
end
