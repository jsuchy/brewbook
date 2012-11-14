Before do
  repository(:default) do |repository|
    transaction = DataMapper::Transaction.new(repository)
    transaction.begin
    repository.adapter.push_transaction(transaction)
  end
end

After do
  repository(:default).adapter.pop_transaction.rollback
end
