require 'Ipng/version'
require 'Ipng/safe_string'

module IPNG
  refine Binding do
    def method_missing(meth, *args, &block)
      self.eval(meth.to_s)
    end
  end

  def self.set(png_image, tag, str)
    png_image.metadata[tag] = str
  end

  def self.set_func(png_image, func)
    set png_image, 'FUNC', func
  end

  def self.set_encr(png_image, tag, str, password)
    set png_image, tag, str.encrypt(password)
  end

  def self.set_func_encr(png_image, func, password)
    set_encr png_image, 'FUNC', func, password
  end
  


  
  def self.get(png_image, tag)
    png_image.metadata[tag]
  end

  def self.get_dec (png_image, tag, password)
    png_image.metadata[tag].to_s.decrypt password
  end
  
  def self.eval_func (png_image)
    proc = Proc.new do
        binding = binding()
        binding.eval(get png_image, 'FUNC')
    end
    
    proc.call
  end
  
  def eval_dec (png_image, password)
     get_dec png_image, 'FUNC', password
  end
  
end
