minetest.register_node("lab:list", {
  description = "Test",
  tiles = {"default_stone.png"},

  on_construct = function(pos)
    local formspec =
      "size[8,2]" ..
      "list[context;test;0,0;8,1;]"..
      "list[current_player;main;0,1;8,1;]"

    local meta = minetest.get_meta(pos)
    meta:set_string("formspec", formspec)

    local inv = meta:get_inventory()
    inv:set_size("test", 5)
    inv:set_stack("test", 5, "default:mese")
  end,

  on_metadata_inventory_take = function(pos, listname, index, stack, player)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    inv:set_list("test", {"default:wood", "default:stick"})

    -- It doesn't work even if the number of entries is exactly right >:(
    inv:set_list("test", {"default:wood", "default:stick", "default:apple", "default:chest", "default:tree"})
  end,
})
