defmodule Lab1Web.UserController do
  use Lab1Web, :controller

  alias Lab1.Workflow.User

  def create(conn, %{"count" => count, "storage" => storage}) do
    storage = Lab1.Helper.translate_storage(storage)

    uSecTime =
      count
      |> String.to_integer()
      |> User.create(storage)

    attrs = %{count: count, uSec: uSecTime}

    conn
    |> put_view(html: Lab1Web.TimingHTML)
    |> render(:timing, attrs: attrs)
  end
end
