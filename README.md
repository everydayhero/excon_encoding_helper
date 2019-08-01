# ExconEncodingHelper

Helper method to read HTTP response bodies with correct encoding.

Our HTTP libraries do not respect the charset field in the
Content-Type header. This provides a simple helper to fix this
problem.

## Usage

See spec/excon_encoding_helper_spec.rb
