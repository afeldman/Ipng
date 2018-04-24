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

    it 'Test wrong encrypted text' do
      IPNG.set_encr(@image, 'Text3', '12345', 'key')
      text = IPNG.get_dec(@image, 'Text3', 'key')
      expect(text).not_to eq('wrong text')
    end  
  end

  describe 'set function' do
    
    it 'Set function in image' do
      IPNG.set_func(@image, 'puts "1"')
      x = IPNG.eval_func(@image)
      expect { x }.to eq('1') 
    end
    
  end
  
end
