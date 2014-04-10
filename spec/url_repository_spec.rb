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

  it "allows user to find 1 url by id" do
    @url_repo.create(original_url: 'http://www.google.com')
    @url_repo.create(original_url: 'http://www.gmail.com')
    expected_url = {id: 2, original_url: 'http://www.gmail.com', visits: 0}

    expect(@url_repo.find(2)).to eq(expected_url)
  end


  it "allows user to update url row" do
    @url_repo.create(original_url: 'http://www.google.com')
    @url_repo.create(original_url: 'http://www.gmail.com')

    @url_repo.update(1, original_url: 'http://www.aol.com')

    expected_urls = [
        {id: 1, original_url: 'http://www.aol.com', visits: 0},
        {id: 2, original_url: 'http://www.gmail.com', visits: 0}
    ]
    expect(@url_repo.all).to match_array(expected_urls)
  end
end