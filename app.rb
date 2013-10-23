# encoding: utf-8

require 'date'
require 'fileutils'

exit if ARGV.empty?

txtlength = 10

class Adddate
  def initialize(getpath)

    @targetfiles = Dir.glob("#{File.expand_path(getpath)}/*.jpg")
    @targetdir   = Dir.glob("#{File.expand_path(getpath)}/")
    
    @targetfiles.each do |i|
      dirsize  = "#{File.expand_path(getpath)}/".length
      dirname  = i.slice(dirsize,2)
      oripath  = File::dirname(i)
      filename = File::basename(i)

      FileUtils::mkdir_p("#{getpath}/#{dirname}")

      # filestat = File.stat(i)
      # updatetime = filestat.mtime.strftime("%Y%m%d")

      timeobj = Date.today.strftime("%y%m%d")
      filename.insert(txtlength,"_#{timeobj}")
      File.rename(i,"#{oripath}/#{dirname}/#{filename.downcase}")
    end

  end
end

Adddate.new("#{ARGV[0]}")

# Adddate.new("./sampleimage")


