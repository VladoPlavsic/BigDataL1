defmodule Lab1Web.DogController do
  use Lab1Web, :controller

  alias Lab1.Workflow.Dog

  def create(conn, %{"count" => count}) do
    uSecTime =
      count
      |> String.to_integer()
      |> Dog.create()

    attrs = %{count: count, uSec: uSecTime}

    conn
    |> put_view(Lab1Web.Views.TimingView)
    |> render(attrs: attrs)
  end
end
