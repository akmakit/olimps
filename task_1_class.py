# class definition
class TaskOneClass:
  # class variables
  file          = None
  input_value   = None
  output_value  = None

  # constructor, not mandatory in our case
  def __init__(self):
    print "Class successfully initializated!"

  # read input file and set input value
  def read_file(self):
    print "Opening file..."
    self.file         = open("input.in", "r")
    self.input_value  = self.file.read()
    print "File opened!"

  # set calculated output value
  def set_output_value(self):
    self.output_value = int(self.input_value) * 2
    print "Output value:", self.output_value

  # output file
  def output_file_content(self):
    print "Generating output file..."
    output_file = open("output.out","w+")
    output_file.write(str(self.output_value))
    output_file.close()
    print "File 'output.out' successfully created!"
