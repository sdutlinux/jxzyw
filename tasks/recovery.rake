#coding: utf-8
require 'roo'
namespace :recovery do
  desc "youzhikecheng"
  task :yzkc do
    puts "import yzkc"
    oo = Excel.new("#{Padrino.root}/doc/youzhikecheng.xls")
    oo.default_sheet = oo.sheets.first

    category_1 = Category.find_by_name('国家级精品课程').id 
    category_2 = Category.find_by_name('省级精品课程').id 
    category_3 = Category.find_by_name('校级精品课程').id 
    category_4 = Category.find_by_name('双语示范课程').id 
    category_5 = Category.find_by_name('重点基础课程').id 
    category_6 = Category.find_by_name('专业核心课程').id 
    category_7 = Category.find_by_name('培育精品课程').id 

    2.upto(oo.last_row) do |line|
      puts "import #{oo.cell(line,'B')}"
      q = QualityCourse.new 
      q.name = oo.cell(line, 'C')
      q.link = oo.cell(line, 'F')
      q.department = oo.cell(line, 'E')
      q.charge_person = oo.cell(line, 'B')
      case oo.cell(line,'G').to_i
      when 49
       q.category_id =  category_1
      when 52
       q.category_id =  category_2
      when 53
       q.category_id =  category_3
      when 59
       q.category_id =  category_4
      when 57
       q.category_id =  category_5
      when 54
       q.category_id =  category_6
      when 58
       q.category_id =  category_7
      else
        next 
      end
      q.year = oo.cell(line, 'D').to_i
      q.save!
    end
  end

  desc  "wangluokecheng"
  task :wlkc do
    puts "import wlkc"
    oo = Excel.new("#{Padrino.root}/doc/wangluokecheng.xls")
    oo.default_sheet = oo.sheets.first
    category_1 = Category.find_by_name('第一批').id 
    category_2 = Category.find_by_name('第二批').id 
    category_3 = Category.find_by_name('第三批').id 
    category_4 = Category.find_by_name('第四批').id 

    2.upto(oo.last_row) do |line|
      puts "import #{oo.cell(line,'B')}"
      n = NetworkCourse.new 
      n.name = oo.cell(line,'B')
      n.link = oo.cell(line,'F')
      n.department = oo.cell(line,'D')
      n.charge_person = oo.cell(line,'C')
      n.subject = oo.cell(line, 'E')
      id = oo.cell(line, 'G').to_i
      if id == 56
        n.category_id = category_4 
      elsif id ==  45 
        n.category_id = category_1
      elsif id == 55 
        n.category_id = category_3 
      else id == 46
        n.category_id = category_2
      end
      n.save!
    end
  end

  desc "jiaoxuechengguo"
  task :jxcg do
    puts "import jxcg"
    oo = Excel.new("#{Padrino.root}/doc/jiaoxuechengguo.xls")
    oo.default_sheet = oo.sheets.first
    category_1 = Category.find_by_name('国家级教学成果')
    category_2 = Category.find_by_name('省级教学成果')
    category_3 = Category.find_by_name('校级教学成果')
    2.upto(oo.last_row) do |line|
      puts "import #{oo.cell(line,'B')}"
      t = TeachingAchievement.new 
      t.name = oo.cell(line,'B')
      t.link = oo.cell(line,'F')
      t.department = oo.cell(line,'D')
      t.charge_person = oo.cell(line,'C')
      t.level = oo.cell(line,'E')
      t.year = oo.cell(line,'G').to_i
      if oo.cell(line,'H').to_i == 18
        t.category_id = category_3
      elsif oo.cell(line,'H').to_i == 15
        t.category_id = category_1.id 
      else oo.cell(line,'H').to_i == 16
        t.category_id = category_2
      end
      t.save!
    end
    
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

  desc "all"
  task :all => [:yzkc, :wlkc, :jxcg, :zyjs, :szdw] do
    puts "hello world"
  end
end
