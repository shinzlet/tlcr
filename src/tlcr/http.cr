require "http/client"

module Tlcr
  class HTTP
    @index_uri : URI
    @base_uri : URI

    def initialize(@index_uri = URI.parse("https://tldr.sh/assets/index.json"),
                   @base_uri = URI.parse("https://raw.githubusercontent.com/tldr-pages/tldr"))
    end

    def index_content
      ::HTTP::Client.get(@index_uri).body
    end

    def page_content(command : Tlcr::Command)
      ::HTTP::Client.get(@base_uri.to_s + "/master/pages/#{command.default_platform}/#{command.name}.md").body
    end
  end
end
