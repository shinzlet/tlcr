require "json"

module Tlcr
  class Index
    include JSON::Serializable

    property commands : Set(Command)

    def available
      @commands.select(&.available?)
    end

    def get(name : String)
      available.find do |command|
        command.name == name
      end
    end
  end

  class Command
    include JSON::Serializable

    property name : String
    property platform : Set(String)

    def available?
      @platform.includes?("common") || @platform.includes?(Tlcr.platform)
    end

    def default_platform
      if @platform.includes?("common")
        "common"
      elsif @platform.includes?(Tlcr.platform)
        Tlcr.platform
      else
        @platform.first
      end
    end
  end
end
