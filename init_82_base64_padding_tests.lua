print(dump(core.decode_base64("d2hhdA==")))
assert(core.decode_base64("VGVzdA==") == "Test")
-- Minetest does not do padding
assert(core.encode_base64("Test") == "VGVzdA")

assert(core.decode_base64("VGVzdA") == "Test")
