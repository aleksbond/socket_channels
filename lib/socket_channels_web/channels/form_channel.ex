defmodule SocketChannelsWeb.FormChannel do
  use Phoenix.Channel

  def join("form:lead", _message, socket) do
    {:ok, socket}
  end

  def join("form:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end 
end
