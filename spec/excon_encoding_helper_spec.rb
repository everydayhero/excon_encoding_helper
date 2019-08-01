require "spec_helper"

RSpec.describe ExconEncodingHelper do
  describe ".read_body" do
    let(:sample_utf8_data) { "µsec" }

    let(:excon_response) do
      double(
        :ExconResponse,
        headers: {
          "Content-Type" => content_type_header,
        }.reject { |_k, v| v.nil? },
        body: body,
      )
    end

    let(:result) { ExconEncodingHelper.read_body(excon_response) }

    describe "with latin1 body that Excon assumed was UTF-8" do
      let(:latin1_data) { sample_utf8_data.encode("ISO8859-1") }
      let(:incorrectly_encoded_data) { latin1_data.force_encoding("UTF-8") }
      let(:latin1_content_type) { "application/json;charset=ISO-8859-1" }

      let(:content_type_header) { latin1_content_type }
      let(:body) { incorrectly_encoded_data.dup }

      it "correctly re-encodes the body to UTF-8" do
        expect(result).to eq(sample_utf8_data)
      end

      it "does not mutate the original response" do
        expect(result).to eq(sample_utf8_data)
        expect(excon_response.body).to eq(incorrectly_encoded_data)
      end
    end

    describe "with unspecified charset" do
      let(:body) { sample_utf8_data }
      let(:content_type_header) { "application/json" }

      it "assumes UTF-8" do
        expect(result).to eq(sample_utf8_data)
      end
    end

    describe "without a content-type header" do
      let(:body) { sample_utf8_data }
      let(:content_type_header) { nil }

      it "assumes UTF-8" do
        expect(result).to eq(sample_utf8_data)
      end
    end
  end
end
