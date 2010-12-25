
require 'rubygems'
require 'RMagick'
require 'jcode'
require 'find'

input_str = "微博卡祝你新年快乐！"

#input_arr = ['微软雅黑','方正稚艺','方正少儿','楷体','方正硬笔行书',\
#  '方正硬笔楷书','方正小篆体','方正瘦金书','方正行黑']
#font_arr = ["ms_yahei.ttf","fz_zhiyi.ttf","fz_shaoer.ttf","kaiti.ttf","fz_yingbixingshu.ttf",\
#  "fz_yingbikaishu.ttf","fz_xiaozhuan.ttf","fz_soujin.ttf","fz_xinghei.ttf"] 


font_path = 'fonts'
Find.find(font_path) do |f|
  if /[tT][tT][fF]/.match(f)==nil then next end
  img = Magick::Image.read('background.png').first    #图片路径
  gc= Magick::Draw.new
  gc.annotate(img, 0, 0, 10, 35, input_str) do  #可以设置文字的位置，参数分别为路径、宽度、高度、横坐标、纵坐标
    self.font = f
    self.pointsize = 25                         #字体的大小
    self.fill = '#fff'                         #字体的颜色
    self.stroke = "none"
  end          
  img.write("outputs\\fontimg_" + File.basename(f, 'ttf') + "png")  
end




