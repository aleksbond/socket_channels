defmodule SocketChannelsWeb.Lead do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @primary_key false
  embedded_schema do
    field :first_name
    field :last_name
    field :email
  end

  @permitted [:first_name, :last_name, :email]
  @required [:first_name, :last_name, :email]

  def changeset(%Lead{} = lead, params \\ %{}) do
    lead
    |> cast(params, @permitted)
    |> validate_required(@required)
    |> validate_format(:email, ~r/@/)
  end
end
