defmodule SocketChannelsWeb.FormChannel do
  use Phoenix.Channel
  alias SocketChannelsWeb.Lead

  def join("form:lead", _message, socket) do
    {:ok, socket}
  end

  def join("form:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end 

  def handle_in("validate_form", %{"params" => params}, socket) do
    changeset = Lead.changeset(%Lead{}, params)

    if changeset.valid? do
      {:reply, {:ok, %{}}, socket}
    else
      errors = Enum.reduce(changeset.errors, %{}, fn ({field, {error_msg, _}}, acc) ->
          Map.put(acc, field, error_msg)
        end)

      {:reply, {:error, %{errors: errors}}, socket}
    end
  end
end
