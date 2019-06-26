class ApiService
  def initialize(params)
    @text= params[:str]
    @file = params[:file]
  end

  def set_5_letters
    arr = []
    str = text
    while str && str.length > 0 do
      step = 5
      if str.length < 5
        arr << str
        break
      elsif str[5] == ' '
        arr << str[0..4]
      else
        if str[0..4].index(' ').nil?
          arr << str[0..4]
        else
          step = str[0..4].index(' ')
          arr << str[0..step]
        end
      end
      str = str[step..-1] if str
      str = str.strip if str
    end
    arr
  end

  def create_yml
    contents = YAML.load_file(file)
    arr_ = ['', '  ', '    ', '      ', '        ', '          ', '            ']
    file_path = "#{Rails.public_path}/translations.yml"
    File.open(file_path, "w+") { |f| f.write('') }
    str = '/'
    contents.each do |c|
      arr = c[0].split('.')
      content = "/"
      arr.each_with_index do |val, i|
        content += val + '.'
        if str.index(val).nil?
          str += content
          val = arr_[i] + val + ':'
          val += "\n" if i+1 != arr.length
          File.open(file_path, "a+") { |f| f << val }
        end
        str += '/'
      end
      File.open(file_path, "a+") { |f| f << " " + c[1] + "\n" }
    end
    file_path
  end

  private

  attr_reader :text, :file

end
