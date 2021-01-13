# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
	{ 
		name: 'Kaynaryan Alexey', 
		login: 'taske'
	},
	{ 
		name: 'Alexey', 
		login: 'master', 
		is_admin: true
	},
	{
		name: 'Test',
		login: 'test'
	}
])

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

tests = Test.create([
	{ 
		title: 'Ruby basics', 
		level: 1,
		category_id: 1
	},
	{
		title: 'Rails basics',
		level: 2,
		category_id: 2
	},
	{
		title: 'Rails advanced',
		level: 3,
		category_id: 2
	},
	{
		title: 'SQL basics',
		level: 2,
		category_id: 3
	}
])

questions = Question.create([
	{
		body: 'В каком варианте вы получите число без пропуска строки от пользователя?',
		test_id: 1
	},
	{
		body: 'Где записана сокращенная форма кода "x = x / 3"',
		test_id: 1
	},
	{
		body: "Сработает ли данный код?\nprint(\"Введите имя: \")\nname = gets\nputs(\"Имя: \" + name)",
		test_id: 1
	},
	{
		body: 'Где указана пустая переменная (без значения)?',
		test_id: 1
	},
	{
		body: 'Как называется самый популярный фреймворк языка Ruby для веба?',
		test_id: 2
	},
	{
		body: 'Что не является элементом MVC?',
		test_id: 2
	},
	{
		body: 'Какой командой запускается локальный веб-сервер',
		test_id: 3
	},
	{
		body: 'Как откатить миграции',
		test_id: 3
	},
	{
		body: 'Чем различаются запросы с UNION и UNION ALL?',
		test_id: 4
	},
	{
		body: "Какой тип отношения между таблицами «Товары» и «Заказы»?\n
			   Имеется база данных интернет-магазина. В этой БД имеются таблицы:\n
               \tПокупатели – хранит информацию по клиентам (ФИО, логин, пароль и т.п.);\n
               \tЗаказы – содержит номер заказа, комментарий, дату доставки, покупателя (который сделал заказ) и т.д.;\n
               \tТовары – id товара, наименование, цена, остатки и т.п.;\n
               \tЗаказанные товары – хранит информацию о заказанных товарах (заказ, товар, количество).",
		test_id: 4
	},
	{
		body: "Какой тип отношения между таблицами «Покупатели» и «Заказы»?\n
			   \tИмеется база данных интернет-магазина. В этой БД имеются таблицы:\n
			   \tПокупатели – хранит информацию по клиентам (ФИО, логин, пароль и т.п.);\n
			   \tЗаказы – содержит номер заказа, комментарий, дату доставки, покупателя (который сделал заказ) и т.д.;\n
			   \tТовары – id товара, наименование, цена, остатки и т.п.;\n
			   \tЗаказанные товары – хранит информацию о заказанных товарах (заказ, товар, количество).",
		test_id: 4
	}
])

answers = Answer.create([
	{
		body: 'num = gets.chomp().to_i',
		correct: true,
		question_id: 1
	},
	{
		body: 'num = gets.chomp()',
		question_id: 1
	},
	{
		body: 'num = chomp().to_i',
		question_id: 1
	},
	{
		body: 'num = gets.to_i',
		question_id: 1
	},
	{
		body: 'num = gets',
		question_id: 1
	},
	{
		body: 'x/3',
		question_id: 2
	},
	{
		body: 'Нет сокращенной формы',
		question_id: 2
	},
	{
		body: 'x = / 3',
		question_id: 2
	},
	{
		body: 'x /= 3',
		correct: true,
		question_id: 2
	},
	{
		body: 'Необходимо дописать name.to_s при выводе информации',
		question_id: 3
	},
	{
		body: 'Код сработает в любом случае',
		correct: true,
		question_id: 3
	},
	{
		body: 'Необходимо дописать gets.chomp()',
		question_id: 3
	},
	{
		body: 'Код сработает только если введут строку, а не число',
		question_id: 3
	},
	{
		body: 'some',
		question_id: 4
	},
	{
		body: 'some = 0',
		question_id: 4
	},
	{
		body: 'some = ""',
		question_id: 4
	},
	{
		body: 'some = nil',
		correct: true,
		question_id: 4
	},
	{
		body: 'Все варианты',
		question_id: 4
	},
	{
		body: 'git init',
		question_id: 5
	},
	{
		body: 'server start',
		question_id: 5
	},
	{
		body: 'rails s',
		correct: true,
		question_id: 5
	},
	{
		body: 'rails c',
		question_id: 5
	},
	{
		body: 'rails new',
		question_id: 5
	},
	{
		body: 'модель',
		question_id: 6
	},
	{
		body: 'представление',
		question_id: 6
	},
	{
		body: 'контроллер',
		question_id: 6
	},
	{
		body: 'маршрут',
		correct: true,
		question_id: 6
	},
	{
		body: 'запрос',
		correct: true,
		question_id: 6
	},
	{
		body: 'rails destroy migrate',
		question_id: 7
	},
	{
		body: 'rails generate viewer',
		question_id: 7
	},
	{
		body: 'rake db:migrate',
		question_id: 7
	},
	{
		body: 'rake db:rollback',
		correct: true,
		question_id: 7
	},
	{
		body: 'rails g',
		question_id: 7
	},
	{
		body: 'Ruby On Rails',
		correct: true,
		question_id: 8
	},
	{
		body: 'Ruby Web',
		question_id: 8
	},
	{
		body: 'Rails',
		question_id: 8
	},
	{
		body: 'Ruby Framework',
		question_id: 8
	},
	{
		body: 'UNION соединить таблицы по принципу внутреннего соединения, но при условии, что строки не будут полностью совпадать. UNION ALL объединит каждую строку из таблицы слева с каждой строкой из таблицы справа',
		question_id: 9
	},
	{
		body: 'UNION объединяет наборы строк, полностью исключая те строки, которые дублируются, т.е. строка из первого набора, которая есть во втором наборе, вообще не будет выдана ни из одного набора. UNION ALL объединяет наборы с сохранением всех строк',
		question_id: 9
	},
	{
		body: 'UNION объединяет наборы строк, исключая дубли, т.е. каждая строка после объединения будет уникальной. UNION ALL объединяет наборы с сохранением всех строк',
		correct: true,
		question_id: 9
	},
	{
		body: 'Различия только в написании операции. UNION - это короткий стиль написания UNION ALL',
		question_id: 9
	},
	{
		body: 'Один к одному',
		question_id: 10
	},
	{
		body: 'Один ко многим',
		question_id: 10
	},
	{
		body: 'Многие ко многим',
		question_id: 10
	},
	{
		body: 'Таблицы никак не связаны',
		correct: true,
		question_id: 10
	},
	{
		body: 'Один к одному',
		question_id: 11
	},
	{
		body: 'Один ко многим',
		correct: true,
		question_id: 11
	},
	{
		body: 'Многие ко многим',
		question_id: 11
	},
	{
		body: 'Таблицы никак не связаны',
		question_id: 11
	}
])

user_histories = UserHistory.create([
	{
		user_id: 1,
		test_id: 1,
		complete: true
	},
	{
		user_id: 1,
		test_id: 2,
		complete: true
	},
	{
		user_id: 1,
		test_id: 3,
		complete: true
	},
	{
		user_id: 1,
		test_id: 4
	},
	{
		user_id: 3,
		test_id: 1
	},
	{
		user_id: 3,
		test_id: 2,
		complete: true
	},
	{
		user_id: 3,
		test_id: 3,
		complete: true
	}
])







