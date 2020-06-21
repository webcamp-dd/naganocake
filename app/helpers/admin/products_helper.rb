module Admin::ProductsHelper

	# 数値を3桁ごとに区切る設定 例1,000円
	def converting_to_jpy(price)
		"#{price.to_s(:delimited, delimiter: ',')}"
	end
end
