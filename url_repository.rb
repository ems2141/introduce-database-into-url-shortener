class UrlRepository
  def initialize(db)
    @urls_table = db[:urls]
  end

  def create(attributes)
    @urls_table.insert(attributes)
  end

  def all
    @urls_table.to_a
  end

  def find(id)
    @urls_table.where(id: id).first
  end

  def update(id, attributes)
    @urls_table.where(id: id).update(attributes)
  end
end

