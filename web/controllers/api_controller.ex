defmodule SecurityTest.ApiController do
  use SecurityTest.Web, :controller

  def sum(conn, _params) do
    conn
    |> send_resp(200, "SUCCESS :)")
  end

  def logout(conn, _params) do
    jwt = Guardian.Plug.current_token(conn)
    claims = Guardian.Plug.claims(conn)
    Guardian.revoke!(jwt, claims)
    render "logout.json"
  end
end
