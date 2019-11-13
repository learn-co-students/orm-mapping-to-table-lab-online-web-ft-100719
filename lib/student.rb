class Student
attr_accessor :name, :grade 
attr_reader :id 
@@all=[]
def initialize(name,grade,id=nil)
  @name = name
  @grade = grade
  @id = id
  @@all << self
end 
  
 def self.create_table
    sql = <<-SQL
      CREATE TABLE students (id INTEGER PRIMARY KEY,
                             name TEXT, 
                             grade TEXT)
      SQL
      DB[:conn].execute(sql)
  end

def self.drop_table
  sql = <<-SQL
      DROP TABLE students
  SQL
  DB[:conn].execute(sql)
end 

def save 
   sql = <<-SQL
      INSERT INTO students (name, grade) 
      VALUES ("?","?")
      SQL
      DB[:conn].execute(sql,name,grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
end
  Student.create_table
rokhaya = Song.new("rokhaya", "4th")
rokhaya.save

 def self.create(name, grade)
    students = Student.new(name,grade)
    students.save
    students
  end
end





  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  

