defmodule IdotodosEx.Campaign do
  use IdotodosEx.Web, :model

  schema "campaigns" do
    field :main_date, Ecto.Date
    field :name, :string
    field :spotify_playlist, :string
    has_one :website, IdotodosEx.Website
    belongs_to :user, IdotodosEx.User
    belongs_to :partner, IdotodosEx.User
    has_many :users, IdotodosEx.User
    has_many :guests, IdotodosEx.Guest
    has_many :registries, IdotodosEx.CampaignRegistry
    has_many :parties, IdotodosEx.Party
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:main_date, :name, :spotify_playlist])
    |> validate_required([:main_date, :name])
    |> validate_format(:name, ~r/^([^\\\/][A-z0-9\-\+]+$)/)
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> changeset(params)
    |> cast_assoc(:partner, required: true, with: &IdotodosEx.User.partner_changeset(&1,&2))
    |> cast_assoc(:user, required: true, with: &IdotodosEx.User.registration_changeset(&1,&2))
  end

  def couple_name(wedding) do
    ~s(#{wedding.user.first_name} #{wedding.user.last_name} and #{wedding.partner.first_name} #{wedding.partner.last_name})
  end
end
