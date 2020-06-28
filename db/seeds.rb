# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ product_category_id: 'Star Wars' }, { product_category_id: 'Lord of the Rings' }])
#   Character.create(product_category_id: 'Luke', movie: movies.first)

	Admin.create!(email: "abcdefg@gmail.com",
	password: "kanrisya",
	password_confirmation: "kanrisya")


	ProductCategory.create!(
		[
		  {
			name: 'ケーキ'
		  },
		  {
			name: 'クッキー'
		  },
		  {
			name: 'マカロン'
		  },
		  {
			name: 'プリン・ゼリー'
		  }
		]
	  )


    Product.create!(
      [
    {product_category_id: 1,unit_price: 4000,name: 'フルーツタルト',description: "フルーツたっぷり使用したタルトです。夏のお誕生ひ祝いにぴったりな爽やかな一品となっております。",sales_status: true,product_image:open("./app/assets/images/cake1.jpg")},
		{product_category_id: 1,unit_price: 700,name: 'チョコレートケーキ',description: "カカオ60％で苦味のある大人のチョコレートケーキです。糖分が抑えられているのでダイエット中の方にもおすすめです",sales_status: true,product_image:open("./app/assets/images/cake2.jpg")},
		{product_category_id: 1,unit_price: 2000,name: 'オレンジタルト',description: "季節のオレンジを使用したタルト。酸味の効いた味わいで甘いものが苦手な方にも楽しんでいただけるかと思います",sales_status: true,product_image:open("./app/assets/images/cake3.jpg")},
		{product_category_id: 1,unit_price: 450,name: '苺のミニパイケーキ',description: "一口サイズのミニパイケーキ。",sales_status: true,product_image:open("./app/assets/images/cake4.jpg")},
		{product_category_id: 1,unit_price: 400,name: 'チーズケーキ',description: "当店ロングセラーのスフレチーズケーキ。レモンの効いたすっきりとした味わいです。長年変わらぬ味で皆様にご愛好いただいている自信作です。",sales_status: true,product_image:open("./app/assets/images/cake5.jpg")},
		{product_category_id: 1,unit_price: 800,name: 'パイで挟んだケーキ',description: "さくっとしたパイ生地の中身はカスタードクリームと生クリームが入っています。とちおとめの苺の甘みと共にお楽しみください",sales_status: true,product_image:open("./app/assets/images/cake6.jpg")},
		{product_category_id: 1,unit_price: 3300,name: 'チョコレートホールケーキ',description: "定番チョコレートケーキ。サイドにはチョコレートマカロン付きです。",sales_status: true,product_image:open("./app/assets/images/cake7.jpg")},
		{product_category_id: 1,unit_price: 4500,name: 'ホールショートケーキ',description: "お誕生日ケーキなど、お祝いにいかがでしょうか。",sales_status: true,product_image:open("./app/assets/images/cake8.jpg")},
		{product_category_id: 2,unit_price: 450,name: 'ハートクッキー',description: "ハート型に焼いたクッキーです。お手頃価格。",sales_status: true,product_image:open("./app/assets/images/cookie1.jpg")},
		{product_category_id: 2,unit_price: 380,name: '人形クッキー',description: "人形型のクッキーです。プレゼント用にどうぞ。",sales_status: true,product_image:open("./app/assets/images/cookie2.jpg")},
		{product_category_id: 2,unit_price: 3300,name: 'チェックッキー',description: "焼く前の状態になります。返品不可。",sales_status: true,product_image:open("./app/assets/images/cookie3.jpg")},
		{product_category_id: 3,unit_price: 350,name: '苺のマカロン',description: "甘酸っぱい苺でピンクが可愛らしいお品となっております",sales_status: true,product_image:open("./app/assets/images/mac1.jpg")},
		{product_category_id: 3,unit_price: 550,name: 'チョコレートのマカロン',description: "ビターなマカロンです。",sales_status: true,product_image:open("./app/assets/images/mac2.jpg")},
		{product_category_id: 3,unit_price: 900,name: '３種のマカロンセット',description: "苺、ピスタチオ、ベリーの人気の３種類がセットになって登場。プレゼントにおすすめです",sales_status: true,product_image:open("./app/assets/images/mac3.jpg")},
		{product_category_id: 3,unit_price: 400,name: '季節限定のレモン味のマカロン',description: "9月末までの限定商品となっております。この季節だけのお味をぜひお楽しみください。",sales_status: true,product_image:open("./app/assets/images/mac4.jpg")},
		{product_category_id: 4,unit_price: 780,name: '瓶入りプリン',description: "とれたての牛乳、卵を使用。",sales_status: true,product_image:open("./app/assets/images/pudding_jelly1.jpg")},
		{product_category_id: 4,unit_price: 250,name: '牛乳プリン',description: "とれたての牛乳、卵を使用。",sales_status: true,product_image:open("./app/assets/images/pudding_jelly2.jpg")},
		{product_category_id: 4,unit_price: 200,name: 'コーヒーゼリー',description: "自家製コーヒー使用。",sales_status: true,product_image:open("./app/assets/images/pudding_jelly3.jpg")},
		{product_category_id: 4,unit_price: 250,name: 'オレンジゼリー',description: "日本産オレンジ使用。",sales_status: true,product_image:open("./app/assets/images/pudding_jelly4.jpg")},
		{product_category_id: 4,unit_price: 300,name: 'イチゴゼリー',description: "日本産イチゴ使用。",sales_status: true,product_image:open("./app/assets/images/pudding_jelly5.jpg")}
      ]
	)