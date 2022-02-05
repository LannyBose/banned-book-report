defmodule BannedBookReport.Repo do
  use Ecto.Repo,
    otp_app: :banned_book_report,
    adapter: Ecto.Adapters.Postgres
end
