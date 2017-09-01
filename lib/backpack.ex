defmodule Backpack do
  defmacro __using__(which) do
    apply(__MODULE__, which, [])
  end

  def moment do
    quote do
      alias Backpack.Moment
    end
  end

  def inflex do
    quote do
      alias Backpack.Inflex
    end
  end
end
