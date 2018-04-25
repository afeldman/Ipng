#!/usr/bin/env ruby

require 'Ipng'
require 'thor'
require 'chunky_png'

class Ipng_CLI < Thor

  desc "set INPUT TAG TEXT OUTPUT PASSWORD", "use a taxt and store it into a given image"
  def set(input, tag, text, output=nil, passwd=nil)
    output ||= 'image.png'
    image = ChunkyPNG::Image.from_file(input)
    unless passwd
      IPNG.set(image, tag, text)
    else
      IPNG.set_encr(image, tag, text, passwd)
    end
    image.save(output)
  end


  desc "get INPUT TAG PASSWORD", "get the text from a given tag and a given image"
  def get(input, tag, passwd=nil)
    image = ChunkyPNG::Image.from_file(input)
    unless passwd
      puts IPNG.get(image, tag)
    else
      puts IPNG.get_dec(image, tag, passwd)
    end
  end

end

Ipng_CLI.start(ARGV)
