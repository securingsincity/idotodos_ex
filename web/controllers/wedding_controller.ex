defmodule IdotodosEx.WeddingController do
  use IdotodosEx.Web, :controller
  alias IdotodosEx.Campaign
  alias IdotodosEx.Repo


  plug :put_layout, "wedding.html"
  def index(conn, %{"name" =>  name}) do
    case Repo.get_by(Campaign, %{name: name}) do
        nil ->
            conn
            |> redirect(to: "/")
        wedding ->
          render(conn, "index.html", wedding: wedding)
    end
    # render(conn, "index.html", campaign_registries: campaign_registries)
  end

end