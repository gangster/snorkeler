require 'snorkeler/error'

module Snorkeler
  class Error
    # Raised when Snorkeler returns a 4xx HTTP status code or there's an error in Faraday
    class ClientError < Snorkeler::Error

      # Create a new error from an HTTP environment
      #
      # @param response [Hash]
      # @return [Snorkeler::Error]
      def self.from_response(response={})
        new(parse_error(response[:body]), response[:response_headers])
      end

    private

      def self.parse_error(body)
        if body.nil?
          ''
        elsif body.match /ERROR/
          body
        end
      end
    end
  end
end
