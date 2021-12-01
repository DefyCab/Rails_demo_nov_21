describe 'POST /api/articles' do
  subject { response }

  describe 'successfully' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'Lets go',
               content: 'Once upon a time in a galaxy far away...'
             }
           }
      # params a key value pair an object.
      # article is resource name and then
      # inside what the article should contain.
      # map attributes like they are used in
      # database
    end

    it 'is expected to return status 201' do
      expect(subject.status).to eq 201
    end

    # it { is_expected.to have_http_status :created } do
    # # Shoulda_matchers syntax

    it 'is expected to return requested articles title' do
      expect(response_json['article']['title']).to eq 'Lets go'
    end
    it 'is expected to return the requested articles content' do
      expect(response_json['article']['content']).to eq 'Once upon a time in a galaxy far away...'
    end

    describe 'unsuccessfully' do
      before do
        post '/api/articles',
             params: {
               article: {
                 #  title: 'Lets go',
                 content: 'Once upon a time in a galaxy far away...'
               }
             }
      end

      describe 'due to missing title' do
        it { is_expected.to have_http_status 422 }

        it 'is expected to respond with an error message' do
          expect(response_json['message']).to eq 'title cant be blank'
        end
      end

      describe 'due to missing params' do
        before do
          post '/api/articles', params: {}
        end

        it { is_expected.to have_http_status 422 }

        it 'is expected to respond with an error message' do
          expect(response_json['message']).to eq 'missing params'
        end
      end
    end
  end
end
