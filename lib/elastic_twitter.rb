require "elasticsearch"
require "active_support/all"


class ElasticTwitter
  def self.connection
    @connection ||= Elasticsearch::Client.new
  end

  def self.index_name
    "lo_itfos"
  end

  def initialize(query)
    @query = self.class.build_query(query)
  end

  def search
    self.class.connection.search @query.merge({index: self.class.index_name})
  end

  # def to_json
  #   search.to_json
  # end

  def self.build_query(query)
    generated = {}
    if query[:terms]
      generated[:body]||={}
      generated[:body][:query]||={}
      generated[:body][:query][:terms] = {text: query[:terms].split(",")}
    end

    generated
  end

  def self.index_file(file)
    File.open(file).each do |line|
      index(JSON.parse(line))
    end
  end

  def self.index(item)
    ElasticTwitter.connection.index index: "lo_itfos", type: "custom", body: item
  end
end
