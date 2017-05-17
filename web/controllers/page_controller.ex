defmodule SecurityTest.PageController do
  use SecurityTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
