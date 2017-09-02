defmodule Backpack.Inflex do
  def camelize(term, first_letter \\ :upper) do
    case first_letter do
      :upper ->
        Backpack.Inflex.Inflector.camelize(term, true)
      :lower ->
        Backpack.Inflex.Inflector.camelize(term, false)
    end
  end

  defdelegate underscore(term), to: Backpack.Inflex.Inflector

  defdelegate dasherize(term), to: Backpack.Inflex.Inflector

  defdelegate humanize(term, opts \\ []), to: Backpack.Inflex.Inflector

  defdelegate parameterize(term, opts \\ []), to: Backpack.Inflex.Inflector

  defdelegate transliterate(term, replacement \\ "?", lang \\ :en), to: Backpack.Inflex.Inflector

  defdelegate titleize(term), to: Backpack.Inflex.Inflector
end
