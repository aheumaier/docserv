require 'json'

class JsonFormatter
  include ActiveResource::Formats::JsonFormat

  attr_reader :collection_name

  def initialize(collection_name)
    @collection_name = collection_name.to_s
  end

  def decode(json)
    remove_root(ActiveSupport::JSON.decode(json))
  end

  private

  def remove_root(data)
    if data.is_a?(Hash) && data[collection_name]
      data[collection_name]
    else
      if data.is_a? Array
        Rails.logger.info 'i am an '+data.class.to_s
        data = data.reduce Hash.new, :merge
      else
        data
      end
    end
  end
end
