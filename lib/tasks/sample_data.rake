namespace :db do
	desc "Fill database with sample data"
	task fill_sample: :environment do
		SchClass.all.each {|x| x.destroy}
		Student.all.each {|x| x.destroy}
		teachers=[
			"张建国",
			"李国庆",
			"刘爱民",
			"王仁贵",
			"赵思勤",
			"孙保强",
			"周志刚",
			"吴大伟",
			"郑家豪",
		].each
		students=[
			"张小明",
			"刘小红",
			"孙小华",
			"李小刚",
			"王小雪",
			"赵小某",
			"Tom",
			"Mary",
			"Someone",
			"Jacque",
			"Emilie",
			"Whichone",
			"まこと",
			"ゆいちゃん",
			"だれか",
			"Pepe",
			"Yoyo",
			"Haha",
			"Kaka",
			"Lulu",
			"Gaga",
			"Ehhh",
		].each
		genders=[
			true,
			false,
			nil,
		].cycle
		tmp=Time.now.to_a
		tmp[5]-=10
		base_time=Time.local(*tmp).to_i
		random_scale=60*60*24*365*2
		(1..3).each do |idx_grade|
			(1..3).each do |idx_class|
				SchClass.create! grade: idx_grade, 
					class_number: idx_class, teacher: teachers.next
			end
		end
		sch_class=SchClass.find_by grade: 1, class_number: 1
		16.times do
			student=Student.create name: students.next, 
				gender: genders.next, 
				birth: Time.at(base_time+rand(random_scale))
			sch_class.students.append student
		end
		3.times do
			Student.create! name: students.next, 
				gender: genders.next, 
				birth: Time.at(base_time+rand(random_scale))
		end
		sch_class=SchClass.find_by grade: 1, class_number: 2
		3.times do
			student=Student.create name: students.next, 
				gender: genders.next, 
				birth: Time.at(base_time+rand(random_scale))
			sch_class.students.append student
		end
	end
end
