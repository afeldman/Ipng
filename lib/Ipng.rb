require 'Ipng/version'
require 'Ipng/safe_string'
require 'chunky_png'

module IPNG

  def self.set png_image, tag, str
    png_image.metadata[tag] = str
  end

  def self.set_func png_image, func
    set png_image, 'FUNC', func
  end

  def self.set_encr png_image, tag, str, password
    set png_image, tag, str.encrypt(password)
  end

  def self.set_func_encr png_image, func, password 
    set_encr png_image, 'FUNC', func, password
  end
  


  
  def self.get(png_image, tag)
    png_image.metadata[tag]
  end

  def self.get_dec (png_image, tag, password)
    png_image.metadata[tag].to_s.decrypt password
  end
  
  def self.eval_func (png_image)
    begin
      eval get png_image, 'FUNC'
      return true
    rescue => e
      puts e
      return false
    end
  end
  
    def self.eval_dec (png_image, password)
      begin
        eval get_dec png_image, 'FUNC', password
        return true
      rescue => e
        puts e
        return false
      end
    end
end

