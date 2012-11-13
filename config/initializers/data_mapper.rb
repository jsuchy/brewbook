require 'dm-core'
require 'dm-migrations'

#An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite::memory:')
