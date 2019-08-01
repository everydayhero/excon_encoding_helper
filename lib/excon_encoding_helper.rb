require "excon_encoding_helper/version"
require "excon_encoding_helper/response"

module ExconEncodingHelper
  def self.read_body(response)
    Response.read_body(response)
  end
end
