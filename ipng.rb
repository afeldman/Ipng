#!/bin/env ruby

#
# file
#

require 'aescrypt' unless Gem.win_platform?
require 'chunky_png'

class Prog
  def f
    puts 'did not overwrite this function. Nothing todo'
  end
end

class ChunkyPNG::Image
  
  def fcreate(function, password = '')
    unless Gem.win_platform?
      metadata['FUNC'] = AESCrypt.encrypt(function, password)
    else
      metadata['FUNC'] = function
    end
  end 
  
  def fexec(password = '')
    unless Gem.win_platform?
      func = AESCrypt.decrypt(metadata['FUNC'],password) if metadata.key? 'FUNC'
    else
      func = metadata['FUNC']
    end
    
    Prog.class_eval(func)

    program = Prog.new
    program.f
  end 

  def fextract(filename, password = '')
    unless Gem.win_platform?
      func = AESCrypt.decrypt(metadata['FUNC'],password) if metadata.key? 'FUNC'
    else
      func = metadata['FUNC']
    end

    File.open(filename,"w") do |line|
      line.puts func
    end
    
  end 
  
end



