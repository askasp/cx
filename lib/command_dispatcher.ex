defprotocol CommandDispatcher do
  def getAggregate(command)
  def getStreamId(command)
  def dispatch(command)
end


defimpl CommandDispatcher, for: Command.CreateUser  do
  def getAggregate(_command), do: UserAggregate
  def getStreamId(_command), do: :uid
  def dispatch(command) do
    aggregate = getAggregate(command)
    stream_id = getStreamId(command)
    {:ok, pid} = aggregate.find_or_start_aggregate_agent(Map.get(command, stream_id))
    #GenServer.call(pid, {:execute, command})
  end
end


defimpl CommandDispatcher, for: Command.CreateInvoice  do
  def getAggregate(_command), do: InvoiceAggregate
  def getStreamId(_command), do: :thread_id
  def dispatch(command) do
    aggregate = getAggregate(command)
    stream_id = getStreamId(command)
    {:ok, pid} = aggregate.find_or_start_aggregate_agent(Map.get(command,stream_id))
    #GenServer.call(pid, {:execute, command})
  end
end




