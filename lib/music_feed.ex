defmodule MusicFeed do
  @moduledoc """
  Call methods on the top-level module to retrieve data.
  All methods return a map with keys :title and :composer
  
  ## Example

      > MusicFeed.counterstream()
      %{ title: "Title of Piece", composer: "Composer of Piece" }

  """

  alias MusicFeed.Parser

  @doc """
  Get piece currently playing on [Countestream](https://www.newmusicusa.org/our-work/about-counterstream-radio/)
  """

  def counterstream do
    [composer, title] = 
      load_url('http://counterstream.newmusicusa.org:8000/currentsong?sid=1')
      |> String.split(" - ")
    %{title: title, composer: composer}
  end

  @doc """
  Get piece currently playing on [SomaFM's Drone Zone](https://somafm.com/dronezone/)
  """

  def somafm_drone_zone do
    load_url('http://api.somafm.com/recent/dronezone.tre.xml')
    |> Parser.parse_somafm
  end

  @doc """
  Get piece currently playing on [New Sounds](https://www.newsounds.org/) (formerly Q2)
  """

  def q2 do
    load_url('https://api.wnyc.org/api/v1/whats_on/q2/')
    |> Parser.parse_q2
  end

  @doc """
  Get piece currently playing on [Columbia University's WKCR](https://www.cc-seas.columbia.edu/wkcr/)
  """

  def wkcr do
    load_url('https://spinitron.com/radio/rss.php?station=wkcr')
    |> Parser.parse_wkcr
  end

  @doc """
  Get piece currently playing on [YLE Klassinen](https://areena.yle.fi/radio/ohjelmat/yle-klassinen/) (Finnish radio)
  """

  def yle_klassinen do
    load_url('https://yle.fi/radiomanint/LiveXML/r17/item(0).xml')
    |> Parser.parse_yle
  end

  defp load_url(url) do
    {:ok, {{_http, 200, 'OK'}, _headers, body }} = 
      :httpc.request(url)

    body
    |> IO.iodata_to_binary
  end
end
