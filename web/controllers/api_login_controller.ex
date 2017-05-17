defmodule SecurityTest.ApiLoginController do
  use SecurityTest.Web, :controller
  alias SecurityTest.User

  def login(conn, %{"email" => user, "password" => pass}) do
    user = Repo.get_by(User, email: user)

    cond do
      user && Comeonin.Bcrypt.checkpw(pass, user.password_hash) ->
        new_conn = Guardian.Plug.api_sign_in(conn, user, :api)
        jwt = Guardian.Plug.current_token(new_conn)
        claims = Guardian.Plug.claims(new_conn)
        {:ok, claims_map}  = claims
        exp = Map.get(claims_map, "exp")

        new_conn
        |> put_resp_header("authorization", "Bearer #{jwt}")
        |> put_resp_header("x-expires", Integer.to_string(exp))
        |> assign(:jwt, jwt)
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "success")
      user ->
        conn
        |> send_resp(401, "wronge password")
      true ->
        Comeonin.Bcrypt.dummy_checkpw()
        conn
        |> send_resp(401, "username not found")
    end
  end
end
