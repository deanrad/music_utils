class Device
  class SonyDscH20 < Device
    def path
      '/Volumes/NO NAME/MP_ROOT'
    end
    
    def interesting_files
      %w{.MP4}
    end
  end
end