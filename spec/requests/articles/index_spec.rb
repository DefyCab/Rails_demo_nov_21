describe 'GET /api/articles' do
  subject { response }
  let!(:article) { create(:article, title: "My own title") }

  before do
    get '/api/articles'
  end

  it 'is expected to respond with status 200' do
    expect(subject.status).to eq 200
  end

  it 'is expected to respond with an empyt array' do
    expect(response_json.first['title']).to eq 'My own title'
  end
end
