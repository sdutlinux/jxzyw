#coding: utf-8
namespace :init do
  desc "create section"
  task :section => :environment do
    sections = [
      {name: '优质课程', :key => 'yzkc'},
      {name: '网络课程', :key => 'wlkc'},
      {name: '教学成果', :key => 'jxcg'},
      {name: '专业建设', :key => 'zyjs'},
      {name: '师资队伍', :key => 'szdw'}
    ]
    Section.create!(sections)
  end
end
