module Tlcr
  class Local
    def initialize(@filename)
    end

    def get(filename : String)
      if File.exists?(filename)
        Tlcr::Page.new(File.read(filename))
      end
    end
  end
end
