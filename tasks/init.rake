#coding: utf-8
namespace :init do
  desc "create section"
  task :section => :environment do
    sections = [
      {name: '优质课程'},
      {name: '网络课程'},
      {name: '教学成果'},
      {name: '专业建设'},
      {name: '师资队伍'}
    ]
    Section.create!(sections)
  end
end
