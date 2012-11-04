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

  desc "shiziduiwu"
  task :szdw do
    puts "import yzkc"
    oo = Excel.new("#{Padrino.root}/doc/shiziduiwu.xls")
    oo.default_sheet = oo.sheets.first

    @category_1 = Category.find_by_name('国家级教学团队').id 
    @category_2 = Category.find_by_name('国家级教学名师').id 
    @category_3 = Category.find_by_name('省级教学团队').id 
    @category_4 = Category.find_by_name('省级教学名师').id 
    @category_5 = Category.find_by_name('校级教学团队').id 
    @category_6 = Category.find_by_name('校级教学名师').id 
    @category_7 = Category.find_by_name('校级优秀教师').id 
    @category_8 = Category.find_by_name('省级优秀教师').id 

    2.upto(oo.last_row) do |line|
      puts "import #{oo.cell(line, 'B')}"
      s = Teacher.new 
      s.name = oo.cell(line,'B')
      s.link = oo.cell(line, 'D')
      s.college = oo.cell(line, 'E')
      s.charge_people = oo.cell(line, 'K')
      s.desc = oo.cell(line, 'C')
      s.project = oo.cell(line, 'G')
      s.achievement = oo.cell(line, 'H')
      s.paper = oo.cell(line, 'I')
      s.award = oo.cell(line, 'J')

      case oo.cell(line, 'F').to_i
      when 3
        s.category_id = @category_1 
      when 4
        s.category_id = @category_2 
      when 5
        s.category_id = @category_3
      when 6
        s.category_id = @category_4 
      when 7
        s.category_id = @category_5 
      when 21
        s.category_id = @category_6
      when 19
        s.category_id = @category_7
      when 10
        s.category_id = @category_8
      else
        next
      end
      s.save!
    end
  end
end
