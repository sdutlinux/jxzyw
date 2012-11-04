#coding: utf-8
namespace :init do
  desc "create section"
  task :sections => :environment do
    sections = [
      {name: '优质课程', :key => 'yzkc'},
      {name: '网络课程', :key => 'wlkc'},
      {name: '教学成果', :key => 'jxcg'},
      {name: '专业建设', :key => 'zyjs'},
      {name: '师资队伍', :key => 'szdw'}
    ]
    Section.create!(sections)
  end

  desc "create categories"
  task :categories  => :environment do
    @yzkc_section = Section.find_by_key('yzkc')
    @wlkc_section = Section.find_by_key('wlkc')
    @jxcg_section = Section.find_by_key('jxcg')
    @zyjs_section = Section.find_by_key('zyjs')
    @szdw_section = Section.find_by_key('szdw')

    categories = [
      {:name =>'国家级精品课程', :section_id => @yzkc_section.id},
      {:name =>'省级精品课程', :section_id => @yzkc_section.id},
      {:name =>'校级精品课程', :section_id => @yzkc_section.id},
      {:name =>'双语示范课程', :section_id => @yzkc_section.id},
      {:name =>'重点基础课程', :section_id => @yzkc_section.id},
      {:name =>'专业核心课程', :section_id => @yzkc_section.id},
      {:name =>'培育精品课程 ', :section_id => @yzkc_section.id},

      {:name => '第一批', :section_id => @wlkc_section.id},
      {:name => '第二批', :section_id => @wlkc_section.id},
      {:name => '第三批', :section_id => @wlkc_section.id},
      {:name => '第四批', :section_id => @wlkc_section.id},

      {:name => '国家级教学成果', :section_id => @jxcg_section.id},
      {:name => '省级教学成果', :section_id => @jxcg_section.id},
      {:name => '校级教学成果', :section_id => @jxcg_section.id},

      {:name => '品牌专业', :section_id => @zyjs_section.id},
      {:name => '特色专业', :section_id => @zyjs_section.id},

      {:name => '国家级教学团队', :section_id => @szdw_section.id},
      {:name => '省级教学团队', :section_id => @szdw_section.id},
      {:name => '校级教学团队', :section_id => @szdw_section.id},
      {:name => '国家级教学名师', :section_id => @szdw_section.id},
      {:name => '省级教学名师', :section_id => @szdw_section.id},
      {:name => '省级优秀教师', :section_id => @szdw_section.id},
      {:name => '校级教学名师', :section_id => @szdw_section.id},
      {:name => '校级优秀教师', :section_id => @szdw_section.id}
    ]

    Category.create!(categories)
  end
end
