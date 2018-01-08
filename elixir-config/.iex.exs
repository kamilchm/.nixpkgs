Application.put_env(:elixir, :ansi_enabled, true)
IEx.configure(
 colors: [
   eval_result: [:cyan, :bright] ,
   eval_error: [[:red, :bright, "\n▶▶▶\n"]],
   eval_info: [:yellow, :bright ],
 ],
 default_prompt: [
   "\e[G", # cursor ⇒ column 1
    :white, "%prefix", :yellow, "|", :white, "%counter", " ", :yellow, "▶", :reset
  ] |> IO.ANSI.format |> IO.chardata_to_string
)
