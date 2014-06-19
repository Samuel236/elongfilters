require 'csv'

File.open('HotSuggestData.xml', 'w') { |file|
	first = true
	names = []
	file.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<HotSuggestList>\n")
	#CSV.foreach("HotSuggestData.csv", encoding: "GB18030:UTF-8") do |row|
	CSV.foreach("HotSuggestData.csv") do |row|
		if first then
			first = false
			names = row
		else
			file.write("<HotCitySuggest ");
			length = names.length
			for index in 0..length
				if !names[index].nil? then
					file.write("#{names[index]}=\"#{row[index]}\" ")
				end
			end
			file.write("/>\n")
		end
	end
	file.write("</HotSuggestList>\n")
}
