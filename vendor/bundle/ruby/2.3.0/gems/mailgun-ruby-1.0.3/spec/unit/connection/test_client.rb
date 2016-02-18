require 'spec_helper'
require 'time'
require 'json'

module Mailgun
  class UnitClient

    attr_reader :options, :block, :body, :code, :response

    def initialize(endpoint, &block)
      @block = block
      @endpoint = endpoint
      @body = nil
      @code = nil
    end

    def [](endpoint, &new_block)
      case
      when block_given? then self.class.new(endpoint, &new_block)
      when block        then self.class.new(endpoint, &block)
      else
        self.class.new(endpoint)
      end
    end

    def send_message(working_domain, data)
      case data
      when Hash
        if data.has_key?(:message)
          if data[:message].is_a?(String)
            data[:message] = convert_string_to_file(data[:message])
          end
          post("#{working_domain}/messages.mime", data)
        else
          post("#{working_domain}/messages", data)
        end
      when MessageBuilder
        post("#{working_domain}/messages", data.message)
      else
        raise ParameterError.new("Unknown data type for data parameter.", data)
      end
    end

    def post(path, data)
      begin
        Response.new(response_generator(@endpoint))
      rescue Exception => e
        raise CommunicationError.new(e), e.response
      end
    end

    def get(path, query_string = nil)
      begin
        Response.new(response_generator(@endpoint))
      rescue Exception => e
        raise CommunicationError.new(e), e.response
      end
    end

    def put(path, data)
      begin
        Response.new(response_generator(@endpoint))
      rescue Exception => e
        raise CommunicationError.new(e), e.response
      end
    end

    def delete(path)
      begin
        Response.new(response_generator(@endpoint))
      rescue Exception => e
        raise CommunicationError.new(e), e.response
      end
    end

    private

    def response_generator(resource_endpoint)
      if resource_endpoint == "messages"
        t = Time.now
        id = "<#{t.to_i}.#{rand(99999999)}.5817@example.com>"
        return JSON.generate({"message" => "Queued. Thank you.", "id" => id})
      end
      if resource_endpoint == "bounces"
        return JSON.generate({"total_count" => 1, "items" => {"created_at" => "Fri, 21 Oct 2011 11:02:55 GMT", "code" => 550, "address" => "baz@example.com", "error" => "Message was not accepted -- invalid mailbox. Local mailbox baz@example.com is unavailable: user not found"}})
      end
      if resource_endpoint == "lists"
        return JSON.generate({"member" => {"vars" => {"age" => 26}, "name" => "Foo Bar", "subscribed" => false, "address" => "bar@example.com"}, "message" => "Mailing list member has been updated"})
      end
      if resource_endpoint == "campaigns"
        return JSON.generate({"message" => "Campaign has been deleted", "id" => "ABC123"})
      end
      if resource_endpoint == "events"
        return JSON.generate({"items" => [], "paging" => {"next"=> "https://api.mailgun.net/v2/thisisatestdomainformailgun.com/events/W3siYiI6ICIyMDE0LTA1LTA3VDAwOjQ1OjUxLjc0MDg5MiswMDowMCIsICJlIjogIjIwMTQtMDUtMDVUMDA6NDU6NTEuNzQwOTgzKzAwOjAwIn0sIHsiYiI6ICIyMDE0LTA1LTA3VDAwOjQ1OjUxLjc0MDg5MiswMDowMCIsICJlIjogIjIwMTQtMDUtMDVUMDA6NDU6NTEuNzQwOTgzKzAwOjAwIn0sIFsiZiJdLCBudWxsLCB7ImFjY291bnQuaWQiOiAiNGU4MjMwZjYxNDc2ZDg2NzEzMDBjNDc2IiwgImRvbWFpbi5uYW1lIjogInRoaXNpc2F0ZXN0ZG9tYWluZm9ybWFpbGd1bi5jb20iLCAic2V2ZXJpdHkiOiAiTk9UIGludGVybmFsIn0sIDEwMCwgbnVsbF0=", "previous"=> "https://api.mailgun.net/v2/thisisatestdomainformailgun.com/events/W3siYiI6ICIyMDE0LTA1LTA3VDAwOjQ1OjUxLjc0MDg5MiswMDowMCIsICJlIjogIjIwMTQtMDUtMDVUMDA6NDU6NTEuNzQwOTgzKzAwOjAwIn0sIHsiYiI6ICIyMDE0LTA1LTA3VDAwOjQ1OjUxLjc0MDg5MiswMDowMCIsICJlIjogIjIwMTQtMDUtMDdUMDA6NDU6NTEuNzQxODkyKzAwOjAwIn0sIFsicCIsICJmIl0sIG51bGwsIHsiYWNjb3VudC5pZCI6ICI0ZTgyMzBmNjE0NzZkODY3MTMwMGM0NzYiLCAiZG9tYWluLm5hbWUiOiAidGhpc2lzYXRlc3Rkb21haW5mb3JtYWlsZ3VuLmNvbSIsICJzZXZlcml0eSI6ICJOT1QgaW50ZXJuYWwifSwgMTAwLCBudWxsXQ=="}})
      end
    end
  end

  class Response

    attr_accessor :body

    def initialize(response)
      @body = response
    end

    # Return response as Ruby Hash
    #
    # @return [Hash] A standard Ruby Hash containing the HTTP result.

    def to_h
      begin
        JSON.parse(@body)
      rescue Exception => e
        raise ParseError.new(e), e
      end
    end

    # Replace @body with Ruby Hash
    #
    # @return [Hash] A standard Ruby Hash containing the HTTP result.

    def to_h!
      begin
        @body = JSON.parse(@body)
      rescue Exception => e
        raise ParseError.new(e), e
      end
    end

    # Return response as Yaml
    #
    # @return [String] A string containing response as YAML

    def to_yaml
      begin
        YAML::dump(JSON.parse(@body))
      rescue Exception => e
        raise ParseError.new(e), e
      end
    end

    # Replace @body with YAML
    #
    # @return [String] A string containing response as YAML

    def to_yaml!
      begin
        @body = YAML::dump(JSON.parse(@body))
      rescue Exception => e
        raise ParseError.new(e), e
      end
    end

    # Return response as Yaml
    #
    # @return [String] A string containing response as YAML

    def to_y
      begin
        YAML::dump(JSON.parse(@body))
      rescue Exception => e
        raise ParseError.new(e), e
      end
    end

    # Replace @body with YAML
    #
    # @return [String] A string containing response as YAML

    def to_y!
      begin
        @body = YAML::dump(JSON.parse(@body))
      rescue Exception => e
        raise ParseError.new(e), e
      end
    end
  end
end
