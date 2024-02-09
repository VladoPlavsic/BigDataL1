defmodule Lab1Web.CatController do
  use Lab1Web, :controller

  alias Lab1.Workflow.Cat

  def create(conn, %{"count" => count}) do
    uSecTime =
      count
      |> String.to_integer()
      |> Cat.create()

    attrs = %{count: count, uSec: uSecTime}

    conn
    |> put_view(Lab1Web.Views.TimingView)
    |> render(attrs: attrs)
  end
end
