class ElasticTwitter
  def self.connection
    @connection ||= Elasticsearch::Client.new
  end

  def self.index_name
    "lo_itfos"
  end

  def initialize(query)
    @query = query
  end

  def search
    self.class.connection.search index: self.class.index_name, body: { query: @query }
  end

  def to_json
    search.to_json
  end
end
