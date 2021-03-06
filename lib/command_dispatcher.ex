defprotocol CommandDispatcher do
  def getAggregate(command)
  def getStreamId(command)
  def resultingEvent(command) # a bit hacking, but effective
  def dispatch(command)
end

defimpl CommandDispatcher, for: Command.CreateUser  do
  def getAggregate(_command), do: UserAggregate
  def getStreamId(_command), do: :uid
  def resultingEvent(_command), do: Event.UserCreated
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
  def resultingEvent(_command), do: Event.InvoiceCreated
  def dispatch(command) do
    aggregate = getAggregate(command)
    stream_id = getStreamId(command)
    {:ok, pid} = aggregate.find_or_start_aggregate_agent(Map.get(command,stream_id))
    #GenServer.call(pid, {:execute, command})
  end
end




