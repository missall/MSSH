class Table
	attr_accessor :table_name, :columns
	def initialize(table_name,columns)
			@table_name = table_name
			@columns    = columns
	end
end