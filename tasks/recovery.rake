#coding: utf-8
require 'roo'
namespace :recovery do
  desc "yzkc"
  task :yzkc do
    puts "import yzkc"
    # oo = Excel.new("#{Padrino.root}/doc/")
  end

  desc "zhuanyejianshe"
  task :zyjs do
    puts "import yzkc"
    oo = Excel.new("#{Padrino.root}/doc/zhuanyejianshe.xls")
    oo.default_sheet = oo.sheets.first
    @category_1 = Category.find_by_name('品牌专业')
    @category_2 = Category.find_by_name('特色专业')
    2.upto(oo.last_row) do |line|
      puts "import #{oo.cell(line,'B')}"

      p = ProfessionalConstruction.new 
      p.name = oo.cell(line, 'B')
      p.college = oo.cell(line, 'C')
      p.phone = oo.cell(line, 'F')
      p.author = oo.cell(line, 'E')
      p.link = oo.cell(line, 'G')

      case oo.cell(line, 'D')
      when '品牌专业'
        p.category_id = @category_1.id 
      when '特色专业'
        p.category_id = @category_2.id 
      else
        next
      end
      p.save!
    end
  end
end
