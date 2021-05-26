defmodule Command.CreateUser do
  use Ecto.Schema
  schema "users" do
    field :name, :string
    field :age, :integer, default: 0
    field :password, :string, redact: true
  end
end

defmodule Person do
  @moduledoc """
  A struct representing a person.
  """

  use TypedStruct

  typedstruct do
    @typedoc "A person"

    field :name, String.t(), enforce: true
    field :age, non_neg_integer()
    field :happy?, boolean(), default: true
    field :phone, String.t()
  end
end
