defmodule SecurityTest.ApiToken do
  use SecurityTest.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> send_resp(401, "this info requires verification")
  end
  def unauthorized(conn, _params) do
    conn
    |> send_resp(401, "this info requires special authorization")
  end
end
