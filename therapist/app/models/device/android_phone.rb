class Device
  class ZoomH2n < Device
    def path
      '/Volumes/H2N_SD/STEREO'
    end
    def interesting_files
      %w{.WAV}
    end
  end
end