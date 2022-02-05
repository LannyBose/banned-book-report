defmodule BannedBookReportWeb.PageController do
  use BannedBookReportWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
