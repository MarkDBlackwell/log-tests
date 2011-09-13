# No longer true:
# 'Insert this code in your file, test/test_helper.rb,'
# 'right above, 'class ActiveSupport::TestCase' '.

module LogTests
  class ShouldIncludeThisFileLog
# TODO: perhaps rename to, 'LogTestFiles'.

    PREFIX='./test/'

#  THIS=PREFIX + Pathname(__FILE__).basename.to_s
    TEST_HELPER = "#{PREFIX}test_helper.rb"

    def self.add
      unless @log.present?
        @previous='no-such'
        f=Rails.root.join 'out/test-should-include-this-file.log'
        FileUtils.rm  f, :force => true
        @log=ActiveSupport::BufferedLogger.new f
      end
      a=caller 0
      i=a.index do |e|
          e.start_with?(PREFIX     ) &&
        ! e.start_with?(TEST_HELPER) &&
        ! e.start_with?(@previous  )
      end
      unless i.blank?
        s=a.at i
        @previous=s.slice(0..s.index(?:))
        @log.add Logger::DEBUG, @previous
      end
    end

  end
end
