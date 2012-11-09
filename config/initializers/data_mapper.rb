require 'dm-core'

#An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite::memory:')
