# Insert this code in your file, test/test_helper.rb,
# right above, 'class ActiveSupport::TestCase'
# TODO: perhaps rename to, 'LogTestFiles'.

class ShouldIncludeThisFileLog
  PREFIX='./test/'
  THIS=PREFIX + Pathname(__FILE__).basename.to_s
  def self.add
    unless @log.present?
      @previous='no-such'
      f=App.root.join 'out/test-should-include-this-file.log'
      FileUtils.rm  f, :force => true
      @log=ActiveSupport::BufferedLogger.new f
    end
    a=caller(0)
    i=a.index do |e|
        e.start_with?(PREFIX   ) &&
      ! e.start_with?(THIS     ) &&
      ! e.start_with?(@previous)
    end
    unless i.blank?
      s=a.at(i)
      @previous=s.slice(0..s.index(?:))
      @log.add(Logger::DEBUG,@previous)
    end
  end
end

class Object
  def require_with_test_logging(*args)
    ShouldIncludeThisFileLog.add
    require_without_test_logging(*args)
  end
  alias_method_chain :require, :test_logging
end
