cairo ← •Import "cairo_h.bqn"
                
surface ← cairo.Cairo_image_surface_create 0‿240‿240
ctx ← cairo.Cairo_create ⟨surface⟩

cairo.Cairo_set_source_rgba ctx‿0‿1‿0‿1
cairo.Cairo_rectangle ctx‿100‿20‿120‿90
cairo.Cairo_fill ⟨ctx⟩

cairo.Cairo_set_source_rgba ctx‿1.0‿0.0‿0.0‿0.5
cairo.Cairo_set_line_width ctx‿5
cairo.Cairo_rectangle ctx‿20‿90‿100‿80
cairo.Cairo_stroke ⟨ctx⟩



cairo.Cairo_set_source_rgba ctx‿0‿0‿1‿1
cairo.Cairo_move_to ctx‿10.0‿50.0
cairo.Cairo_set_font_size ctx‿28.0
cairo.Cairo_show_text ctx‿("hello world.png"∾@)

pat ← cairo.Cairo_pattern_create_radial 150‿150‿20‿140‿140‿128.0
cairo.Cairo_pattern_add_color_stop_rgba pat‿0‿1‿1‿0‿1
cairo.Cairo_pattern_add_color_stop_rgba pat‿1‿0‿1‿1‿1
cairo.Cairo_set_source ctx‿pat
cairo.Cairo_arc ctx‿170.0‿170.0‿50‿0‿(2×π)
cairo.Cairo_fill ⟨ctx⟩
cairo.Cairo_pattern_destroy ⟨pat⟩

res ← cairo.Cairo_surface_write_to_png surface‿("cairo_example.png"∾@)
•Show res

cairo.Cairo_destroy ⟨ctx⟩
cairo.Cairo_surface_destroy ⟨surface⟩


