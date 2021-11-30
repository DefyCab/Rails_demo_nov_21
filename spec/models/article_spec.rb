RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
  end
  describe 'Validations' do
    it { is_expected.to validate_prescene_of :title }
  end
  describe 'Content table' do
    it { is_expected.to have_db_column :content }
  end
  describe 'Validate content' do
    it { is expected.to validate_presence_of :content }
  end

  it 'is expected to have a valid Factory' do
    expect(create(:article)).to be_valid
  end
end
