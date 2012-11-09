require 'dm-core'
DataMapper::Logger.new($stdout, :debug)

#An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite::memory:')
