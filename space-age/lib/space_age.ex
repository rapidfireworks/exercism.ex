defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @seconds_per_year_on_earth 31_557_600

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds), do: seconds / seconds_per_year(planet)

  defp seconds_per_year(planet), do: orbital_period_ratio(planet) * @seconds_per_year_on_earth

  defp orbital_period_ratio(:mercury), do: 0.240_846_7
  defp orbital_period_ratio(:venus), do: 0.615_197_26
  defp orbital_period_ratio(:earth), do: 1
  defp orbital_period_ratio(:mars), do: 1.880_815_8
  defp orbital_period_ratio(:jupiter), do: 11.862_615
  defp orbital_period_ratio(:saturn), do: 29.447_498
  defp orbital_period_ratio(:uranus), do: 84.016_846
  defp orbital_period_ratio(:neptune), do: 164.791_32
end
