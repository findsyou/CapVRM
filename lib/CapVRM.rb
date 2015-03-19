require "CapVRM/version"

require 'net/http'
require 'active_support'

module CapVRM
  class Wrapper
    attr_reader :response_hash
    attr_reader :data_hash
    def initialize(xml)
      @response_hash = Hash.from_xml(xml)
      if found?
        @data_hash  = (data['CAP'] || {}).merge(data['DVLA']||{})
      end
    end
    def found?
      (!!data) && (response_hash["RESPONSE"]["MATCHLEVEL"]["DVLA"] == "1" || response_hash["RESPONSE"]["MATCHLEVEL"]["CAP"] == "1")
    end
    private
    def data
      @response_hash['RESPONSE']['DATA']
    end
    def method_missing method, *args, &block
      if found?
        new_key = method.to_s.upcase
        data_hash[new_key] || super
      else
        super
      end      
    end
  end
  def self.config args
    @username = args[:username]
    @password = args[:password]
    @base_url = args[:base_url] || "http://webservices.capnetwork.co.uk/capdvla_webservice/capdvla.asmx/DVLALookupVRM"
    @call_url = "#{@base_url}?SubscriberID=#{@username}&Password=#{@password}&vrm="
  end
  def self.fetch vrm
    full_url = @call_url + CGI::escape(vrm)
    url = URI.parse(full_url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    Wrapper.new(res.body)
  end
end
