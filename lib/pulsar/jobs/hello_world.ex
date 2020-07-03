defmodule Pulsar.Jobs.HelloWorld do
  def child_spec(_arg) do
    Periodic.child_spec(
      id: __MODULE__,
      run: &run/0,
      every: :timer.seconds(5),
      telemetry_id: :hello_world
    )
  end

  defp run() do
    IO.puts("Hello World!")
  end
end
