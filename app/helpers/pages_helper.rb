module PagesHelper
  def markdown(text)
    text.gsub!(/\*\*([^\*]*)\*\*/) { |s| s.delete!('*'); s="<b>"+s+"</b>" }
    text.gsub!(/\\\\([^\\]*)\\\\/) { |s| s.delete!('\\'); s="<i>"+s+"</i>" }
    text.gsub!(/\(\(([^\(\)]*)\)\)/) do |s|
      s.delete!('()')
      s=s.split(' ')
      s="<a href=\"#{s[0]}\">"+s[1]+"</a>"
    end
    text.html_safe
  end
end
