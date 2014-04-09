require './url_repository'
require 'sequel'

describe UrlRepository do

  before do
    db = Sequel.connect('postgres://gschool_user:password@localhost/urls_test')
    db.create_table! :urls do
      primary_key :id
      String :original_url
      Integer :visits, default: 0
    end
    @url_repo = UrlRepository.new(db)
  end

  it "should store URLs" do
    @url_repo.create(original_url: 'http://www.google.com')
    @url_repo.create(original_url: 'http://www.gmail.com')
    urls = @url_repo.all

    expected_urls = [
        {id: 1, original_url: 'http://www.google.com', visits: 0},
        {id: 2, original_url: 'http://www.gmail.com', visits: 0}
    ]
    expect(urls).to match_array(expected_urls)
  end
end