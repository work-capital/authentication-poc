
defmodule SecurityTest.SessionController do
  use SecurityTest.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => user, "password" => pass}}) do

    case SecurityTest.Auth.login_by_email_and_pass(conn, user, pass, repo: Repo) do
    {:ok, conn} ->
      logged_in_user = Guardian.Plug.current_resource(conn)
      conn
      |> put_flash(:info, "Logged in")
      |> redirect(to: user_path(conn, :show, logged_in_user))
    {:error, _reason, conn} ->
      conn
      |> put_flash(:error, "Wrong username/password")
      |> render("new.html")
   end
end

def delete(conn, _) do
  conn
  |> Guardian.Plug.sign_out
  |> redirect(to: "/")
end
end
