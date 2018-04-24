require 'Ipng'
require 'chunky_png'

describe IPNG, 'Test IPNG' do

  before(:each) do
    @image = ChunkyPNG::Image.from_file('spec/img/gentoo_tux.png') 
  end
  
  describe 'set text' do
    it 'Test string in image' do
      IPNG.set(@image, 'Text1', '12345')
      text = IPNG.get(@image, 'Text1')
      expect(text).to eq('12345')
    end
    it 'Test encrypted text' do
      IPNG.set_encr(@image, 'Text2', '12345', 'key')
      text = IPNG.get_dec(@image, 'Text2', 'key')
      expect(text).to eq('12345')
    end
  end

  describe 'set function' do
    it 'Set function in image' do
      IPNG.set_func(@image, 'puts "This is a test"')
      expect(IPNG.eval_func(@image)).to eq(true) 
    end
    it 'Set encrypted function in image' do
      IPNG.set_func_encr @image, 'puts "This is a encrypted test"', 'test12'
      expect(IPNG.eval_dec(@image, 'test12')).to eq(true) 
    end
    
  end
  
end
