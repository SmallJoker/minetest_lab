local texts = {
--                                               | 50 is here
[[

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy]],

[[eirmod tempor invidunt ut labore et dolore
magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
dolores et ea rebum. Stet clita]]
}

print("core.line_break(text, 50)")
for i, text in ipairs(texts) do
	local lines = core.line_break(text, 50)
	print("\t" .. table.concat(lines, "\n\t"))
	print("")
end
print("core.wrap_text(text, 50, true, newlines)")
for i, text in ipairs(texts) do
	local lines = core.wrap_text(text, 50, true, true)
	print("\t" .. table.concat(lines, "\t"))
	print("")
end

print("core.wrap_text(text, 50, true, no newlines)")
for i, text in ipairs(texts) do
	local lines = core.wrap_text(text, 50, true, false)
	print("\t" .. table.concat(lines, "\n\t"))
	print("")
end