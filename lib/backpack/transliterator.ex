defmodule Backpack.Transliterator do
  @available_transliterations %{}
  @default Backpack.Transliterator.Default

  def get(lang) do
    Map.get(@available_transliterations, lang, @default)
  end
end
