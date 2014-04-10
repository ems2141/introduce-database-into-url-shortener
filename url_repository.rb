class UrlRepository
  def initialize(db)
    @urls_table = db[:urls]
  end

  def create(url_original)
    @urls_table.insert(url_original)
  end

  def all
    @urls_table.to_a
  end

  def find(id)
    @urls_table.where(id: id).first
  end

  def update(id, url_original)
    @urls_table.where(id: id).update(url_original)
  end
end

