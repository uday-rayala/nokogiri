module Nokogiri
  module XML
    ###
    # Parse the DTD contained in io_or_string
    def self.DTD io_or_string
      DTD.parse io_or_string
    end

    class DTD < Nokogiri::XML::Node
      ###
      # Parse the DTD contained in io_or_string
      def self.parse io_or_string
        if [:read, :close].all? { |m| io_or_string.respond_to? m }
          parse_io(io_or_string, 0)
        else
          parse_io(StringIO.new(io_or_string), 0)
        end
      end

      ###
      # Return attributes for DTD.  Always returns +nil+
      def attributes
        nil
      end
    end
  end
end
