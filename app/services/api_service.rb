class ApiService
  def initialize(params)
    @text= params[:str]
    @file = params[:file]
    @num = params[:num]
  end

  def set_5_letters
    arr = []
    str = text
    while str && str.length > 0 do
      step = num.to_i
      if str.length < step
        arr << str
        break
      elsif str[step] == ' '
        arr << str[0..step-1]
      else
        if str[0..step-1].index(' ').nil?
          arr << str[0..step-1]
        else
          s = str[0..step-1]
          step = (0...s.length).find_all{ |i| s[i,1] == ' ' }.last
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

  attr_reader :text, :num, :file

end
