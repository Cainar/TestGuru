# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# опробывал разные способы создания связанных записей, через id и без
kaynaryan_alexey = User.create(
  name: 'Kaynaryan Alexey', 
	login: 'taske',
	email: 'kay@mail.ru',
  password: 'pass1'
)

alexey = User.create( 
	name: 'Alexey', 
	login: 'master', 
	is_admin: true,
	email: 'alex@gmail.com',
  password: 'pass2'
)

test_user = User.create(
	name: 'Test',
	login: 'test',
	email: 'test@test.com',
  password: 'pass3'
)

categories = Category.create([
	{
		title: 'Ruby'
	},
	{
		title: 'Ruby on Rails'
	},
	{
		title: 'SQL'
	}
])

# проверяю разные способы
tests = alexey.created_tests.create([
	{
  	title: 'Ruby basics', 
  	category: categories[0],	
	},
	{
		title: 'Rails basics',
		level: 2,
		category: categories[1]
	},
	{
		title: 'Rails advanced',
		level: 3,
		category: categories[1]
	},
	{
		title: 'SQL basics',
		level: 2,
		category: categories[2]
	}
])

questions = Question.create ([
	{
		body: 'В каком варианте вы получите число без пропуска строки от пользователя?',
		test: tests[0]
	},
	{
		body: 'Где записана сокращенная форма кода "x = x / 3"',
		test: tests[0]
	},
	{
		body: "Сработает ли данный код?\nprint(\"Введите имя: \")\nname = gets\nputs(\"Имя: \" + name)",
		test: tests[0]
	},
	{
		body: 'Где указана пустая переменная (без значения)?',
		test: tests[0]
	},
	{
		body: 'Как называется самый популярный фреймворк языка Ruby для веба?',
		test: tests[1]
	},
	{
		body: 'Что не является элементом MVC?',
		test: tests[1]
	},
	{
		body: 'Какой командой запускается локальный веб-сервер',
		test: tests[2]
	},
	{
		body: 'Как откатить миграции',
		test: tests[2]
	},
	{
		body: 'Чем различаются запросы с UNION и UNION ALL?',
		test: tests[3]
	},
	{
		body: "Какой тип отношения между таблицами «Товары» и «Заказы»?\n
			   Имеется база данных интернет-магазина. В этой БД имеются таблицы:\n
               \tПокупатели – хранит информацию по клиентам (ФИО, логин, пароль и т.п.);\n
               \tЗаказы – содержит номер заказа, комментарий, дату доставки, покупателя (который сделал заказ) и т.д.;\n
               \tТовары – id товара, наименование, цена, остатки и т.п.;\n
               \tЗаказанные товары – хранит информацию о заказанных товарах (заказ, товар, количество).",
		test: tests[3]
	},
	{
		body: "Какой тип отношения между таблицами «Покупатели» и «Заказы»?\n
			   \tИмеется база данных интернет-магазина. В этой БД имеются таблицы:\n
			   \tПокупатели – хранит информацию по клиентам (ФИО, логин, пароль и т.п.);\n
			   \tЗаказы – содержит номер заказа, комментарий, дату доставки, покупателя (который сделал заказ) и т.д.;\n
			   \tТовары – id товара, наименование, цена, остатки и т.п.;\n
			   \tЗаказанные товары – хранит информацию о заказанных товарах (заказ, товар, количество).",
		test: tests[3]
	}
])

answers = Answer.create ([
	{
		body: 'num = gets.chomp().to_i',
		correct: true,
		question: questions[0]
	},
	{
		body: 'num = gets.chomp()',
		question: questions[0]
	},
	{
		body: 'num = chomp().to_i',
		question: questions[0]
	},
	{
		body: 'num = gets.to_i',
		question: questions[0]
	},
	{
		body: 'x/3',
		question: questions[1]
	},
	{
		body: 'Нет сокращенной формы',
		question: questions[1]
	},
	{
		body: 'x = / 3',
		question: questions[1]
	},
	{
		body: 'x /= 3',
		correct: true,
		question: questions[1]
	},
	{
		body: 'Необходимо дописать name.to_s при выводе информации',
		question: questions[2]
	},
	{
		body: 'Код сработает в любом случае',
		correct: true,
		question: questions[2]
	},
	{
		body: 'Необходимо дописать gets.chomp()',
		question: questions[2]
	},
	{
		body: 'Код сработает только если введут строку, а не число',
		question: questions[2]
	},
	{
		body: 'some',
		question: questions[3]
	},
	{
		body: 'some = 0',
		question: questions[3]
	},
	{
		body: 'some = ""',
		question: questions[3]
	},
	{
		body: 'some = nil',
		correct: true,
		question: questions[3]
	},
	{
		body: 'git init',
		question: questions[6]
	},
	{
		body: 'server start',
		question: questions[6]
	},
	{
		body: 'rails s',
		correct: true,
		question: questions[6]
	},
	{
		body: 'rails c',
		question: questions[6]
	},
	{
		body: 'модель',
		question: questions[5]
	},
	{
		body: 'представление',
		question: questions[5]
	},
	{
		body: 'маршрут',
		correct: true,
		question: questions[5]
	},
	{
		body: 'запрос',
		correct: true,
		question: questions[5]
	},
	{
		body: 'rails destroy migrate',
		question: questions[7]
	},
	{
		body: 'rails generate viewer',
		question: questions[7]
	},
	{
		body: 'rake db:migrate',
		question: questions[7]
	},
	{
		body: 'rake db:rollback',
		correct: true,
		question: questions[7]
	},
	{
		body: 'Ruby On Rails',
		correct: true,
		question: questions[4]
	},
	{
		body: 'Ruby Web',
		question: questions[4]
	},
	{
		body: 'Rails',
		question: questions[4]
	},
	{
		body: 'Ruby Framework',
		question: questions[4]
	},
	{
		body: 'UNION соединить таблицы по принципу внутреннего соединения, но при условии, что строки не будут полностью совпадать. UNION ALL объединит каждую строку из таблицы слева с каждой строкой из таблицы справа',
		question: questions[8]
	},
	{
		body: 'UNION объединяет наборы строк, полностью исключая те строки, которые дублируются, т.е. строка из первого набора, которая есть во втором наборе, вообще не будет выдана ни из одного набора. UNION ALL объединяет наборы с сохранением всех строк',
		question: questions[8]
	},
	{
		body: 'UNION объединяет наборы строк, исключая дубли, т.е. каждая строка после объединения будет уникальной. UNION ALL объединяет наборы с сохранением всех строк',
		correct: true,
		question: questions[8]
	},
	{
		body: 'Различия только в написании операции. UNION - это короткий стиль написания UNION ALL',
		question: questions[8]
	},
	{
		body: 'Один к одному',
		question: questions[9]
	},
	{
		body: 'Один ко многим',
		question: questions[9]
	},
	{
		body: 'Многие ко многим',
		question: questions[9]
	},
	{
		body: 'Таблицы никак не связаны',
		correct: true,
		question: questions[9]
	},
	{
		body: 'Один к одному',
		question: questions[10]
	},
	{
		body: 'Один ко многим',
		correct: true,
		question: questions[10]
	},
	{
		body: 'Многие ко многим',
		question: questions[10]
	},
	{
		body: 'Таблицы никак не связаны',
		question: questions[10]
	}
])

#user_histories = UserHistory.create([
#	{
#		user: kaynaryan_alexey,
#		test_id: tests[0].id,
#		complete: true
#	},
#	{
#		user: kaynaryan_alexey,
#		test: tests[1],
#		complete: true
#	},
#	{
#		user: kaynaryan_alexey,
#		test: tests[2],
#		complete: true
#	},
#	{
#		user: kaynaryan_alexey,
#		test: tests[3]
#	},
#	{
#		user_id: test_user.id,
#		test: tests[0]
#	},
#	{
#		user: test_user,
#		test: tests[1],
#		complete: true
#	},
#	{
#		user: test_user,
#		test: tests[2],
#		complete: true
#	}
#])







