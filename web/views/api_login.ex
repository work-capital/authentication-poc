defmodule SecurityTest.ApiLoginView do
  use SecurityTest.Web, :view

  def render("login.json", %{jwt: jwt, conn: conn, user: user}) do
   %{ jwt: jwt }
  end
end
