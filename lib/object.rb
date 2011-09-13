class Object

  if 'test'==ENV["RAILS_ENV"]

    def require_with_test_logging *args
      LogTests::ShouldIncludeThisFileLog.add
      require_without_test_logging *args
    end

    alias_method_chain :require, :test_logging

  end

end
