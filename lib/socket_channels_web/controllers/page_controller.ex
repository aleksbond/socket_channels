defmodule SocketChannelsWeb.PageController do
  use SocketChannelsWeb, :controller
  alias SocketChannelsWeb.Lead

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def lead_form(conn, _params) do
    changeset = Lead.changeset(%Lead{})
    render(conn, "lead_form.html", changeset: changeset)
  end

  def lead_form_create(conn, %{"lead" => lead_form}) do
    IO.inspect(lead_form, label: "LEAD FORM")
    changeset = Lead.changeset(%Lead{}, lead_form)
    IO.inspect(changeset, label: "LEAD CHANGSET")

    render(conn, "lead_form.html", changeset: %{changeset | action: :insert})
  end
end
