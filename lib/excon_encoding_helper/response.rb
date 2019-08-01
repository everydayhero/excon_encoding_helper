require "content_type"

module ExconEncodingHelper
  class Response
    TARGET_ENCODING = "UTF-8"

    def self.read_body(response)
      new(response.headers["Content-Type"], response.body).read_body
    end

    def initialize(content_type, body)
      @content_type = content_type
      @body = body
    end

    def read_body
      body
        .force_encoding(charset)
        .encode!(TARGET_ENCODING)
    end

    private

    def body
      @body.dup
    end

    def charset
      ContentType.parse(@content_type).charset || TARGET_ENCODING
    rescue
      TARGET_ENCODING
    end
  end
end
