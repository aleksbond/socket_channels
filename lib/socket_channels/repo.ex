defmodule SocketChannels.Repo do
  use Ecto.Repo,
    otp_app: :socket_channels,
    adapter: Ecto.Adapters.Postgres
end
