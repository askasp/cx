defmodule EventHandler.UserReadModel do
  defstruct [:some_state]

  def interested_in do
    [UserCreated]
  end


  def handle(event, metadata) do
    if event in interested_in() do
      handle_event(event,metadata)
    else
      :ok
    end
  end


  defp handle_event(event,metadata) do
    "tbd"
  end


end
