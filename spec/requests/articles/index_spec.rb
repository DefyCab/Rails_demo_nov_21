describe 'GET /api/articles' do
  subject { response }
  let!(:article) { create(:article, title: "Very exiting title") }

  before do
    get '/api/articles'
  end

  it 'is expected to respond with status 200' do
    expect(subject.status).to eq 200
  end

  it 'is expected to respond with a title' do
    expect(response_json.first['title']).to eq 'Very exiting title'
  end
end
