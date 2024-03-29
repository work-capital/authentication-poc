defmodule SecurityTest.Token do
  use SecurityTest.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:info, "You must be signed in to access this page")
    |> redirect(to: session_path(conn, :new))
  end
  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "You must be authorized to access this page")
    |> redirect(to: session_path(conn, :new))
  end
end
