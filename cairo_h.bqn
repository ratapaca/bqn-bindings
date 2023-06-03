# BQN binding for Cairo 1.17

osName ← {1⊸↓⌾⌽𝕩}(1⊑•Sh ⟨"uname"⟩)
lib ← { "Linux": "/usr/lib/libcairo.so";
        "Darwin":"/opt/homebrew/lib/libcairo.2.dylib" } osName
# for Darwin "/opt/homebrew/lib/libcairo.dylib"
# for Linux lib ← "/usr/lib/libcairo.so"

i8   ⇐ "i8"         # 
u8   ⇐ "u8"         # 
i32  ⇐ "i32"        # int
i64  ⇐ "i64"        # int
u32  ⇐ "u32"        # uint
f32  ⇐ "f32"        # float
f64  ⇐ "f64"        # double
str  ⇐ "*i8:c8"     # []char, i.e. string
rtn_str  ⇐ "*:c8"   # []char, i.e. string
enum ⇐ "i32"        # enum, i.e. int
ptr  ⇐ "*:i32"      # pointer

# Helper to create FFI function
# 𝕩 ← outputType‿functionName‿inputType‿...
Ffi ← {𝕊 𝕩: lib•FFI 𝕩}

# Helper to create a struct from a list of types, 
# e.g. "{i32, f32, *i8:c8}"
Struct ⇐{'{'∾'}'«∾','∾¨𝕩}

cairo_version ⇐ Ffi i32‿"cairo_version"
# cairo_public int --
cairo_version_string ⇐ Ffi rtn_str‿"cairo_version_string"
# cairo_public const char * --
cairo_create ⇐ Ffi ptr‿"cairo_create"‿ptr
# cairo_public cairo_t * --| cairo_surface_t * 
cairo_reference ⇐ Ffi ptr‿"cairo_reference"‿ptr
# cairo_public cairo_t * --| cairo_t * 
cairo_destroy ⇐ Ffi ""‿"cairo_destroy"‿ptr
# cairo_public void --| cairo_t * 
cairo_get_reference_count ⇐ Ffi u32‿"cairo_get_reference_count"‿ptr
# cairo_public unsigned int --| cairo_t * 
cairo_get_user_data ⇐ Ffi ptr‿"cairo_get_user_data"‿ptr‿ptr
# cairo_public void * --| cairo_t * | const cairo_user_data_key_t * 
cairo_save ⇐ Ffi ""‿"cairo_save"‿ptr
# cairo_public void --| cairo_t * 
cairo_restore ⇐ Ffi ""‿"cairo_restore"‿ptr
# cairo_public void --| cairo_t * 
cairo_push_group ⇐ Ffi ""‿"cairo_push_group"‿ptr
# cairo_public void --| cairo_t * 
cairo_push_group_with_content ⇐ Ffi ""‿"cairo_push_group_with_content"‿ptr‿enum
# cairo_public void --| cairo_t * | cairo_content_t 
cairo_pop_group ⇐ Ffi ptr‿"cairo_pop_group"‿ptr
# cairo_public cairo_pattern_t * --| cairo_t * 
cairo_pop_group_to_source ⇐ Ffi ""‿"cairo_pop_group_to_source"‿ptr
# cairo_public void --| cairo_t * 
cairo_set_operator ⇐ Ffi ""‿"cairo_set_operator"‿ptr‿enum
# cairo_public void --| cairo_t * | cairo_operator_t 
cairo_set_source ⇐ Ffi ""‿"cairo_set_source"‿ptr‿ptr
# cairo_public void --| cairo_t * | cairo_pattern_t * 
cairo_set_source_rgb ⇐ Ffi ""‿"cairo_set_source_rgb"‿ptr‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double | double | double 
cairo_set_source_rgba ⇐ Ffi ""‿"cairo_set_source_rgba"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double | double | double | double 
cairo_set_source_surface ⇐ Ffi ""‿"cairo_set_source_surface"‿ptr‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | cairo_surface_t * | double | double 
cairo_set_tolerance ⇐ Ffi ""‿"cairo_set_tolerance"‿ptr‿f64
# cairo_public void --| cairo_t * | double 
cairo_set_antialias ⇐ Ffi ""‿"cairo_set_antialias"‿ptr‿enum
# cairo_public void --| cairo_t * | cairo_antialias_t 
cairo_set_fill_rule ⇐ Ffi ""‿"cairo_set_fill_rule"‿ptr‿enum
# cairo_public void --| cairo_t * | cairo_fill_rule_t 
cairo_set_line_width ⇐ Ffi ""‿"cairo_set_line_width"‿ptr‿f64
# cairo_public void --| cairo_t * | double 
# cairo_set_hairline ⇐ Ffi ""‿"cairo_set_hairline"‿ptr‿i8
# cairo_public void --| cairo_t * | cairo_bool_t 
cairo_set_line_cap ⇐ Ffi ""‿"cairo_set_line_cap"‿ptr‿enum
# cairo_public void --| cairo_t * | cairo_line_cap_t 
cairo_set_line_join ⇐ Ffi ""‿"cairo_set_line_join"‿ptr‿enum
# cairo_public void --| cairo_t * | cairo_line_join_t 
cairo_set_dash ⇐ Ffi ""‿"cairo_set_dash"‿ptr‿f64‿i32‿f64
# cairo_public void --| cairo_t * | const double * | int | double 
cairo_set_miter_limit ⇐ Ffi ""‿"cairo_set_miter_limit"‿ptr‿f64
# cairo_public void --| cairo_t * | double 
cairo_translate ⇐ Ffi ""‿"cairo_translate"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double | double 
cairo_scale ⇐ Ffi ""‿"cairo_scale"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double | double 
cairo_rotate ⇐ Ffi ""‿"cairo_rotate"‿ptr‿f64
# cairo_public void --| cairo_t * | double 
cairo_transform ⇐ Ffi ""‿"cairo_transform"‿ptr‿ptr
# cairo_public void --| cairo_t * | const cairo_matrix_t * 
cairo_set_matrix ⇐ Ffi ""‿"cairo_set_matrix"‿ptr‿ptr
# cairo_public void --| cairo_t * | const cairo_matrix_t * 
cairo_identity_matrix ⇐ Ffi ""‿"cairo_identity_matrix"‿ptr
# cairo_public void --| cairo_t * 
cairo_user_to_device ⇐ Ffi ""‿"cairo_user_to_device"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * 
cairo_user_to_device_distance ⇐ Ffi ""‿"cairo_user_to_device_distance"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * 
cairo_device_to_user ⇐ Ffi ""‿"cairo_device_to_user"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * 
cairo_device_to_user_distance ⇐ Ffi ""‿"cairo_device_to_user_distance"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * 
cairo_new_path ⇐ Ffi ""‿"cairo_new_path"‿ptr
# cairo_public void --| cairo_t * 
cairo_move_to ⇐ Ffi ""‿"cairo_move_to"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double | double 
cairo_new_sub_path ⇐ Ffi ""‿"cairo_new_sub_path"‿ptr
# cairo_public void --| cairo_t * 
cairo_line_to ⇐ Ffi ""‿"cairo_line_to"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double | double 
cairo_curve_to ⇐ Ffi ""‿"cairo_curve_to"‿ptr‿f64‿f64‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double | double | double | double | double | double 
cairo_arc ⇐ Ffi ""‿"cairo_arc"‿ptr‿f64‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double | double | double | double | double 
cairo_arc_negative ⇐ Ffi ""‿"cairo_arc_negative"‿ptr‿f64‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double | double | double | double | double 
cairo_rel_move_to ⇐ Ffi ""‿"cairo_rel_move_to"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double | double 
cairo_rel_line_to ⇐ Ffi ""‿"cairo_rel_line_to"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double | double 
cairo_rel_curve_to ⇐ Ffi ""‿"cairo_rel_curve_to"‿ptr‿f64‿f64‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double | double | double | double | double | double 
cairo_rectangle ⇐ Ffi ""‿"cairo_rectangle"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double | double | double | double 
cairo_close_path ⇐ Ffi ""‿"cairo_close_path"‿ptr
# cairo_public void --| cairo_t * 
cairo_path_extents ⇐ Ffi ""‿"cairo_path_extents"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * | double * | double * 
cairo_paint ⇐ Ffi ""‿"cairo_paint"‿ptr
# cairo_public void --| cairo_t * 
cairo_paint_with_alpha ⇐ Ffi ""‿"cairo_paint_with_alpha"‿ptr‿f64
# cairo_public void --| cairo_t * | double 
cairo_mask ⇐ Ffi ""‿"cairo_mask"‿ptr‿ptr
# cairo_public void --| cairo_t * | cairo_pattern_t * 
cairo_mask_surface ⇐ Ffi ""‿"cairo_mask_surface"‿ptr‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | cairo_surface_t * | double | double 
cairo_stroke ⇐ Ffi ""‿"cairo_stroke"‿ptr
# cairo_public void --| cairo_t * 
cairo_stroke_preserve ⇐ Ffi ""‿"cairo_stroke_preserve"‿ptr
# cairo_public void --| cairo_t * 
cairo_fill ⇐ Ffi ""‿"cairo_fill"‿ptr
# cairo_public void --| cairo_t * 
cairo_fill_preserve ⇐ Ffi ""‿"cairo_fill_preserve"‿ptr
# cairo_public void --| cairo_t * 
cairo_copy_page ⇐ Ffi ""‿"cairo_copy_page"‿ptr
# cairo_public void --| cairo_t * 
cairo_show_page ⇐ Ffi ""‿"cairo_show_page"‿ptr
# cairo_public void --| cairo_t * 
cairo_in_stroke ⇐ Ffi u32‿"cairo_in_stroke"‿ptr‿f64‿f64
# cairo_public cairo_bool_t --| cairo_t * | double | double 
cairo_in_fill ⇐ Ffi u32‿"cairo_in_fill"‿ptr‿f64‿f64
# cairo_public cairo_bool_t --| cairo_t * | double | double 
cairo_in_clip ⇐ Ffi u32‿"cairo_in_clip"‿ptr‿f64‿f64
# cairo_public cairo_bool_t --| cairo_t * | double | double 
cairo_stroke_extents ⇐ Ffi ""‿"cairo_stroke_extents"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * | double * | double * 
cairo_fill_extents ⇐ Ffi ""‿"cairo_fill_extents"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * | double * | double * 
cairo_reset_clip ⇐ Ffi ""‿"cairo_reset_clip"‿ptr
# cairo_public void --| cairo_t * 
cairo_clip ⇐ Ffi ""‿"cairo_clip"‿ptr
# cairo_public void --| cairo_t * 
cairo_clip_preserve ⇐ Ffi ""‿"cairo_clip_preserve"‿ptr
# cairo_public void --| cairo_t * 
cairo_clip_extents ⇐ Ffi ""‿"cairo_clip_extents"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * | double * | double * 
cairo_copy_clip_rectangle_list ⇐ Ffi ptr‿"cairo_copy_clip_rectangle_list"‿ptr
# cairo_public cairo_rectangle_list_t * --| cairo_t * 
cairo_rectangle_list_destroy ⇐ Ffi ""‿"cairo_rectangle_list_destroy"‿ptr
# cairo_public void --| cairo_rectangle_list_t * 
cairo_tag_begin ⇐ Ffi ""‿"cairo_tag_begin"‿ptr‿str‿str
# cairo_public void --| cairo_t * | const char * | const char * 
cairo_tag_end ⇐ Ffi ""‿"cairo_tag_end"‿ptr‿str
# cairo_public void --| cairo_t * | const char * 
cairo_glyph_allocate ⇐ Ffi ptr‿"cairo_glyph_allocate"‿i32
# cairo_public cairo_glyph_t * --| int 
cairo_glyph_free ⇐ Ffi ""‿"cairo_glyph_free"‿ptr
# cairo_public void --| cairo_glyph_t * 
cairo_text_cluster_allocate ⇐ Ffi ptr‿"cairo_text_cluster_allocate"‿i32
# cairo_public cairo_text_cluster_t * --| int 
cairo_text_cluster_free ⇐ Ffi ""‿"cairo_text_cluster_free"‿ptr
# cairo_public void --| cairo_text_cluster_t * 
cairo_font_options_create ⇐ Ffi ptr‿"cairo_font_options_create"
# cairo_public cairo_font_options_t * --
cairo_font_options_copy ⇐ Ffi ptr‿"cairo_font_options_copy"‿ptr
# cairo_public cairo_font_options_t * --| const cairo_font_options_t * 
cairo_font_options_destroy ⇐ Ffi ""‿"cairo_font_options_destroy"‿ptr
# cairo_public void --| cairo_font_options_t * 
cairo_font_options_status ⇐ Ffi enum‿"cairo_font_options_status"‿ptr
# cairo_public cairo_status_t --| cairo_font_options_t * 
cairo_font_options_merge ⇐ Ffi ""‿"cairo_font_options_merge"‿ptr‿ptr
# cairo_public void --| cairo_font_options_t * | const cairo_font_options_t * 
cairo_font_options_equal ⇐ Ffi u32‿"cairo_font_options_equal"‿ptr‿ptr
# cairo_public cairo_bool_t --| const cairo_font_options_t * | const cairo_font_options_t * 
cairo_font_options_hash ⇐ Ffi i64‿"cairo_font_options_hash"‿ptr
# cairo_public unsigned long --| const cairo_font_options_t * 
cairo_font_options_set_antialias ⇐ Ffi ""‿"cairo_font_options_set_antialias"‿ptr‿enum
# cairo_public void --| cairo_font_options_t * | cairo_antialias_t 
cairo_font_options_get_antialias ⇐ Ffi enum‿"cairo_font_options_get_antialias"‿ptr
# cairo_public cairo_antialias_t --| const cairo_font_options_t * 
cairo_font_options_set_subpixel_order ⇐ Ffi ""‿"cairo_font_options_set_subpixel_order"‿ptr‿enum
# cairo_public void --| cairo_font_options_t * | cairo_subpixel_order_t 
cairo_font_options_get_subpixel_order ⇐ Ffi enum‿"cairo_font_options_get_subpixel_order"‿ptr
# cairo_public cairo_subpixel_order_t --| const cairo_font_options_t * 
cairo_font_options_set_hint_style ⇐ Ffi ""‿"cairo_font_options_set_hint_style"‿ptr‿i32
# cairo_public void --| cairo_font_options_t * | cairo_hint_style_t 
cairo_font_options_get_hint_style ⇐ Ffi i32‿"cairo_font_options_get_hint_style"‿ptr
# cairo_public cairo_hint_style_t --| const cairo_font_options_t * 
cairo_font_options_set_hint_metrics ⇐ Ffi ""‿"cairo_font_options_set_hint_metrics"‿ptr‿i32
# cairo_public void --| cairo_font_options_t * | cairo_hint_metrics_t 
cairo_font_options_get_hint_metrics ⇐ Ffi i32‿"cairo_font_options_get_hint_metrics"‿ptr
# cairo_public cairo_hint_metrics_t --| const cairo_font_options_t * 
cairo_font_options_get_variations ⇐ Ffi rtn_str‿"cairo_font_options_get_variations"‿ptr
# cairo_public const char * --| cairo_font_options_t * 
cairo_font_options_set_variations ⇐ Ffi ""‿"cairo_font_options_set_variations"‿ptr‿str
# cairo_public void --| cairo_font_options_t * | const char * 
# cairo_font_options_set_color_mode ⇐ Ffi ""‿"cairo_font_options_set_color_mode"‿ptr‿enum
# cairo_public void --| cairo_font_options_t * | cairo_color_mode_t 
# cairo_font_options_get_color_mode ⇐ Ffi enum‿"cairo_font_options_get_color_mode"‿ptr
# cairo_public cairo_color_mode_t --| const cairo_font_options_t * 
# cairo_font_options_get_color_palette ⇐ Ffi u32‿"cairo_font_options_get_color_palette"‿ptr
# cairo_public unsigned int --| const cairo_font_options_t * 
# cairo_font_options_set_color_palette ⇐ Ffi ""‿"cairo_font_options_set_color_palette"‿ptr‿u32
# cairo_public void --| cairo_font_options_t * | unsigned int 
# cairo_font_options_set_custom_palette_color ⇐ Ffi ""‿"cairo_font_options_set_custom_palette_color"‿ptr‿u32‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_font_options_t * | unsigned int | double | double | double | double 
# cairo_font_options_get_custom_palette_color ⇐ Ffi enum‿"cairo_font_options_get_custom_palette_color"‿ptr‿u32‿f64‿f64‿f64‿f64
# cairo_public cairo_status_t --| cairo_font_options_t * | unsigned int | double * | double * | double * | double * 
cairo_select_font_face ⇐ Ffi ""‿"cairo_select_font_face"‿ptr‿str‿enum‿enum
# cairo_public void --| cairo_t * | const char * | cairo_font_slant_t | cairo_font_weight_t 
cairo_set_font_size ⇐ Ffi ""‿"cairo_set_font_size"‿ptr‿f64
# cairo_public void --| cairo_t * | double 
cairo_set_font_matrix ⇐ Ffi ""‿"cairo_set_font_matrix"‿ptr‿ptr
# cairo_public void --| cairo_t * | const cairo_matrix_t * 
cairo_get_font_matrix ⇐ Ffi ""‿"cairo_get_font_matrix"‿ptr‿ptr
# cairo_public void --| cairo_t * | cairo_matrix_t * 
cairo_set_font_options ⇐ Ffi ""‿"cairo_set_font_options"‿ptr‿ptr
# cairo_public void --| cairo_t * | const cairo_font_options_t * 
cairo_get_font_options ⇐ Ffi ""‿"cairo_get_font_options"‿ptr‿ptr
# cairo_public void --| cairo_t * | cairo_font_options_t * 
cairo_set_font_face ⇐ Ffi ""‿"cairo_set_font_face"‿ptr‿ptr
# cairo_public void --| cairo_t * | cairo_font_face_t * 
cairo_get_font_face ⇐ Ffi ptr‿"cairo_get_font_face"‿ptr
# cairo_public cairo_font_face_t * --| cairo_t * 
cairo_set_scaled_font ⇐ Ffi ""‿"cairo_set_scaled_font"‿ptr‿ptr
# cairo_public void --| cairo_t * | const cairo_scaled_font_t * 
cairo_get_scaled_font ⇐ Ffi ptr‿"cairo_get_scaled_font"‿ptr
# cairo_public cairo_scaled_font_t * --| cairo_t * 
cairo_show_text ⇐ Ffi ""‿"cairo_show_text"‿ptr‿str
# cairo_public void --| cairo_t * | const char * 
cairo_show_glyphs ⇐ Ffi ""‿"cairo_show_glyphs"‿ptr‿ptr‿i32
# cairo_public void --| cairo_t * | const cairo_glyph_t * | int 
cairo_show_text_glyphs ⇐ Ffi ""‿"cairo_show_text_glyphs"‿ptr‿str‿i32‿ptr‿i32‿ptr‿i32‿enum
# cairo_public void --| cairo_t * | const char * | int | const cairo_glyph_t * | int | const cairo_text_cluster_t * | int | cairo_text_cluster_flags_t 
cairo_text_path ⇐ Ffi ""‿"cairo_text_path"‿ptr‿str
# cairo_public void --| cairo_t * | const char * 
cairo_glyph_path ⇐ Ffi ""‿"cairo_glyph_path"‿ptr‿ptr‿i32
# cairo_public void --| cairo_t * | const cairo_glyph_t * | int 
cairo_text_extents ⇐ Ffi ""‿"cairo_text_extents"‿ptr‿str‿ptr
# cairo_public void --| cairo_t * | const char * | cairo_text_extents_t * 
cairo_glyph_extents ⇐ Ffi ""‿"cairo_glyph_extents"‿ptr‿ptr‿i32‿ptr
# cairo_public void --| cairo_t * | const cairo_glyph_t * | int | cairo_text_extents_t * 
cairo_font_extents ⇐ Ffi ""‿"cairo_font_extents"‿ptr‿ptr
# cairo_public void --| cairo_t * | cairo_font_extents_t * 
cairo_font_face_reference ⇐ Ffi ptr‿"cairo_font_face_reference"‿ptr
# cairo_public cairo_font_face_t * --| cairo_font_face_t * 
cairo_font_face_destroy ⇐ Ffi ""‿"cairo_font_face_destroy"‿ptr
# cairo_public void --| cairo_font_face_t * 
cairo_font_face_get_reference_count ⇐ Ffi u32‿"cairo_font_face_get_reference_count"‿ptr
# cairo_public unsigned int --| cairo_font_face_t * 
cairo_font_face_status ⇐ Ffi enum‿"cairo_font_face_status"‿ptr
# cairo_public cairo_status_t --| cairo_font_face_t * 
cairo_font_face_get_type ⇐ Ffi enum‿"cairo_font_face_get_type"‿ptr
# cairo_public cairo_font_type_t --| cairo_font_face_t * 
cairo_font_face_get_user_data ⇐ Ffi ptr‿"cairo_font_face_get_user_data"‿ptr‿ptr
# cairo_public void * --| cairo_font_face_t * | const cairo_user_data_key_t * 
cairo_scaled_font_create ⇐ Ffi ptr‿"cairo_scaled_font_create"‿ptr‿ptr‿ptr‿ptr
# cairo_public cairo_scaled_font_t * --| cairo_font_face_t * | const cairo_matrix_t * | const cairo_matrix_t * | const cairo_font_options_t * 
cairo_scaled_font_reference ⇐ Ffi ptr‿"cairo_scaled_font_reference"‿ptr
# cairo_public cairo_scaled_font_t * --| cairo_scaled_font_t * 
cairo_scaled_font_destroy ⇐ Ffi ""‿"cairo_scaled_font_destroy"‿ptr
# cairo_public void --| cairo_scaled_font_t * 
cairo_scaled_font_get_reference_count ⇐ Ffi u32‿"cairo_scaled_font_get_reference_count"‿ptr
# cairo_public unsigned int --| cairo_scaled_font_t * 
cairo_scaled_font_status ⇐ Ffi enum‿"cairo_scaled_font_status"‿ptr
# cairo_public cairo_status_t --| cairo_scaled_font_t * 
cairo_scaled_font_get_type ⇐ Ffi enum‿"cairo_scaled_font_get_type"‿ptr
# cairo_public cairo_font_type_t --| cairo_scaled_font_t * 
cairo_scaled_font_get_user_data ⇐ Ffi ptr‿"cairo_scaled_font_get_user_data"‿ptr‿ptr
# cairo_public void * --| cairo_scaled_font_t * | const cairo_user_data_key_t * 
cairo_scaled_font_extents ⇐ Ffi ""‿"cairo_scaled_font_extents"‿ptr‿ptr
# cairo_public void --| cairo_scaled_font_t * | cairo_font_extents_t * 
cairo_scaled_font_text_extents ⇐ Ffi ""‿"cairo_scaled_font_text_extents"‿ptr‿str‿ptr
# cairo_public void --| cairo_scaled_font_t * | const char * | cairo_text_extents_t * 
cairo_scaled_font_glyph_extents ⇐ Ffi ""‿"cairo_scaled_font_glyph_extents"‿ptr‿ptr‿i32‿ptr
# cairo_public void --| cairo_scaled_font_t * | const cairo_glyph_t * | int | cairo_text_extents_t * 
cairo_scaled_font_text_to_glyphs ⇐ Ffi enum‿"cairo_scaled_font_text_to_glyphs"‿ptr‿f64‿f64‿str‿i32‿ptr‿i32‿ptr‿i32‿ptr
# cairo_public cairo_status_t --| cairo_scaled_font_t * | double | double | const char * | int | cairo_glyph_t * * | int * | cairo_text_cluster_t * * | int * | cairo_text_cluster_flags_t * 
cairo_scaled_font_get_font_face ⇐ Ffi ptr‿"cairo_scaled_font_get_font_face"‿ptr
# cairo_public cairo_font_face_t * --| cairo_scaled_font_t * 
cairo_scaled_font_get_font_matrix ⇐ Ffi ""‿"cairo_scaled_font_get_font_matrix"‿ptr‿ptr
# cairo_public void --| cairo_scaled_font_t * | cairo_matrix_t * 
cairo_scaled_font_get_ctm ⇐ Ffi ""‿"cairo_scaled_font_get_ctm"‿ptr‿ptr
# cairo_public void --| cairo_scaled_font_t * | cairo_matrix_t * 
cairo_scaled_font_get_scale_matrix ⇐ Ffi ""‿"cairo_scaled_font_get_scale_matrix"‿ptr‿ptr
# cairo_public void --| cairo_scaled_font_t * | cairo_matrix_t * 
cairo_scaled_font_get_font_options ⇐ Ffi ""‿"cairo_scaled_font_get_font_options"‿ptr‿ptr
# cairo_public void --| cairo_scaled_font_t * | cairo_font_options_t * 
cairo_toy_font_face_create ⇐ Ffi ptr‿"cairo_toy_font_face_create"‿str‿enum‿enum
# cairo_public cairo_font_face_t * --| const char * | cairo_font_slant_t | cairo_font_weight_t 
cairo_toy_font_face_get_family ⇐ Ffi rtn_str‿"cairo_toy_font_face_get_family"‿ptr
# cairo_public const char * --| cairo_font_face_t * 
cairo_toy_font_face_get_slant ⇐ Ffi enum‿"cairo_toy_font_face_get_slant"‿ptr
# cairo_public cairo_font_slant_t --| cairo_font_face_t * 
cairo_toy_font_face_get_weight ⇐ Ffi enum‿"cairo_toy_font_face_get_weight"‿ptr
# cairo_public cairo_font_weight_t --| cairo_font_face_t * 
cairo_user_font_face_create ⇐ Ffi ptr‿"cairo_user_font_face_create"
# cairo_public cairo_font_face_t * --
cairo_user_font_face_set_init_func ⇐ Ffi ""‿"cairo_user_font_face_set_init_func"‿ptr‿ptr
# cairo_public void --| cairo_font_face_t * | cairo_user_scaled_font_init_func_t 
cairo_user_font_face_set_render_glyph_func ⇐ Ffi ""‿"cairo_user_font_face_set_render_glyph_func"‿ptr‿ptr
# cairo_public void --| cairo_font_face_t * | cairo_user_scaled_font_render_glyph_func_t 
# cairo_user_font_face_set_render_color_glyph_func ⇐ Ffi ""‿"cairo_user_font_face_set_render_color_glyph_func"‿ptr‿ptr
# cairo_public void --| cairo_font_face_t * | cairo_user_scaled_font_render_glyph_func_t 
cairo_user_font_face_set_text_to_glyphs_func ⇐ Ffi ""‿"cairo_user_font_face_set_text_to_glyphs_func"‿ptr‿ptr
# cairo_public void --| cairo_font_face_t * | cairo_user_scaled_font_text_to_glyphs_func_t 
cairo_user_font_face_set_unicode_to_glyph_func ⇐ Ffi ""‿"cairo_user_font_face_set_unicode_to_glyph_func"‿ptr‿ptr
# cairo_public void --| cairo_font_face_t * | cairo_user_scaled_font_unicode_to_glyph_func_t 
cairo_user_font_face_get_init_func ⇐ Ffi ptr‿"cairo_user_font_face_get_init_func"‿ptr
# cairo_public cairo_user_scaled_font_init_func_t --| cairo_font_face_t * 
cairo_user_font_face_get_render_glyph_func ⇐ Ffi ptr‿"cairo_user_font_face_get_render_glyph_func"‿ptr
# cairo_public cairo_user_scaled_font_render_glyph_func_t --| cairo_font_face_t * 
# cairo_user_font_face_get_render_color_glyph_func ⇐ Ffi ptr‿"cairo_user_font_face_get_render_color_glyph_func"‿ptr
# cairo_public cairo_user_scaled_font_render_glyph_func_t --| cairo_font_face_t * 
cairo_user_font_face_get_text_to_glyphs_func ⇐ Ffi ptr‿"cairo_user_font_face_get_text_to_glyphs_func"‿ptr
# cairo_public cairo_user_scaled_font_text_to_glyphs_func_t --| cairo_font_face_t * 
cairo_user_font_face_get_unicode_to_glyph_func ⇐ Ffi ptr‿"cairo_user_font_face_get_unicode_to_glyph_func"‿ptr
# cairo_public cairo_user_scaled_font_unicode_to_glyph_func_t --| cairo_font_face_t * 
# cairo_user_scaled_font_get_foreground_marker ⇐ Ffi ptr‿"cairo_user_scaled_font_get_foreground_marker"‿ptr
# cairo_public cairo_pattern_t * --| cairo_scaled_font_t * 
# cairo_user_scaled_font_get_foreground_source ⇐ Ffi ptr‿"cairo_user_scaled_font_get_foreground_source"‿ptr
# cairo_public cairo_pattern_t * --| cairo_scaled_font_t * 
cairo_get_operator ⇐ Ffi enum‿"cairo_get_operator"‿ptr
# cairo_public cairo_operator_t --| cairo_t * 
cairo_get_source ⇐ Ffi ptr‿"cairo_get_source"‿ptr
# cairo_public cairo_pattern_t * --| cairo_t * 
cairo_get_tolerance ⇐ Ffi f64‿"cairo_get_tolerance"‿ptr
# cairo_public double --| cairo_t * 
cairo_get_antialias ⇐ Ffi enum‿"cairo_get_antialias"‿ptr
# cairo_public cairo_antialias_t --| cairo_t * 
cairo_has_current_point ⇐ Ffi u32‿"cairo_has_current_point"‿ptr
# cairo_public cairo_bool_t --| cairo_t * 
cairo_get_current_point ⇐ Ffi ""‿"cairo_get_current_point"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * 
cairo_get_fill_rule ⇐ Ffi enum‿"cairo_get_fill_rule"‿ptr
# cairo_public cairo_fill_rule_t --| cairo_t * 
cairo_get_line_width ⇐ Ffi f64‿"cairo_get_line_width"‿ptr
# cairo_public double --| cairo_t * 
# cairo_get_hairline ⇐ Ffi u32‿"cairo_get_hairline"‿ptr
# cairo_public cairo_bool_t --| cairo_t * 
cairo_get_line_cap ⇐ Ffi enum‿"cairo_get_line_cap"‿ptr
# cairo_public cairo_line_cap_t --| cairo_t * 
cairo_get_line_join ⇐ Ffi enum‿"cairo_get_line_join"‿ptr
# cairo_public cairo_line_join_t --| cairo_t * 
cairo_get_miter_limit ⇐ Ffi f64‿"cairo_get_miter_limit"‿ptr
# cairo_public double --| cairo_t * 
cairo_get_dash_count ⇐ Ffi i32‿"cairo_get_dash_count"‿ptr
# cairo_public int --| cairo_t * 
cairo_get_dash ⇐ Ffi ""‿"cairo_get_dash"‿ptr‿f64‿f64
# cairo_public void --| cairo_t * | double * | double * 
cairo_get_matrix ⇐ Ffi ""‿"cairo_get_matrix"‿ptr‿ptr
# cairo_public void --| cairo_t * | cairo_matrix_t * 
cairo_get_target ⇐ Ffi ptr‿"cairo_get_target"‿ptr
# cairo_public cairo_surface_t * --| cairo_t * 
cairo_get_group_target ⇐ Ffi ptr‿"cairo_get_group_target"‿ptr
# cairo_public cairo_surface_t * --| cairo_t * 
cairo_copy_path ⇐ Ffi ptr‿"cairo_copy_path"‿ptr
# cairo_public cairo_path_t * --| cairo_t * 
cairo_copy_path_flat ⇐ Ffi ptr‿"cairo_copy_path_flat"‿ptr
# cairo_public cairo_path_t * --| cairo_t * 
cairo_append_path ⇐ Ffi ""‿"cairo_append_path"‿ptr‿ptr
# cairo_public void --| cairo_t * | const cairo_path_t * 
cairo_path_destroy ⇐ Ffi ""‿"cairo_path_destroy"‿ptr
# cairo_public void --| cairo_path_t * 
cairo_status ⇐ Ffi enum‿"cairo_status"‿ptr
# cairo_public cairo_status_t --| cairo_t * 
cairo_status_to_string ⇐ Ffi rtn_str‿"cairo_status_to_string"‿enum
# cairo_public const char * --| cairo_status_t 
cairo_device_reference ⇐ Ffi ptr‿"cairo_device_reference"‿ptr
# cairo_public cairo_device_t * --| cairo_device_t * 
cairo_device_get_type ⇐ Ffi enum‿"cairo_device_get_type"‿ptr
# cairo_public cairo_device_type_t --| cairo_device_t * 
cairo_device_status ⇐ Ffi enum‿"cairo_device_status"‿ptr
# cairo_public cairo_status_t --| cairo_device_t * 
cairo_device_acquire ⇐ Ffi enum‿"cairo_device_acquire"‿ptr
# cairo_public cairo_status_t --| cairo_device_t * 
cairo_device_release ⇐ Ffi ""‿"cairo_device_release"‿ptr
# cairo_public void --| cairo_device_t * 
cairo_device_flush ⇐ Ffi ""‿"cairo_device_flush"‿ptr
# cairo_public void --| cairo_device_t * 
cairo_device_finish ⇐ Ffi ""‿"cairo_device_finish"‿ptr
# cairo_public void --| cairo_device_t * 
cairo_device_destroy ⇐ Ffi ""‿"cairo_device_destroy"‿ptr
# cairo_public void --| cairo_device_t * 
cairo_device_get_reference_count ⇐ Ffi u32‿"cairo_device_get_reference_count"‿ptr
# cairo_public unsigned int --| cairo_device_t * 
cairo_device_get_user_data ⇐ Ffi ptr‿"cairo_device_get_user_data"‿ptr‿ptr
# cairo_public void * --| cairo_device_t * | const cairo_user_data_key_t * 
cairo_surface_create_similar ⇐ Ffi ptr‿"cairo_surface_create_similar"‿ptr‿enum‿i32‿i32
# cairo_public cairo_surface_t * --| cairo_surface_t * | cairo_content_t | int | int 
cairo_surface_create_similar_image ⇐ Ffi ptr‿"cairo_surface_create_similar_image"‿ptr‿enum‿i32‿i32
# cairo_public cairo_surface_t * --| cairo_surface_t * | cairo_format_t | int | int 
cairo_surface_map_to_image ⇐ Ffi ptr‿"cairo_surface_map_to_image"‿ptr‿i32
# cairo_public cairo_surface_t * --| cairo_surface_t * | const cairo_rectangle_int_t * 
cairo_surface_unmap_image ⇐ Ffi ""‿"cairo_surface_unmap_image"‿ptr‿ptr
# cairo_public void --| cairo_surface_t * | cairo_surface_t * 
cairo_surface_create_for_rectangle ⇐ Ffi ptr‿"cairo_surface_create_for_rectangle"‿ptr‿f64‿f64‿f64‿f64
# cairo_public cairo_surface_t * --| cairo_surface_t * | double | double | double | double 
cairo_surface_create_observer ⇐ Ffi ptr‿"cairo_surface_create_observer"‿ptr‿enum
# cairo_public cairo_surface_t * --| cairo_surface_t * | cairo_surface_observer_mode_t 
cairo_surface_observer_add_paint_callback ⇐ Ffi enum‿"cairo_surface_observer_add_paint_callback"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_surface_observer_callback_t | void * 
cairo_surface_observer_add_mask_callback ⇐ Ffi enum‿"cairo_surface_observer_add_mask_callback"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_surface_observer_callback_t | void * 
cairo_surface_observer_add_fill_callback ⇐ Ffi enum‿"cairo_surface_observer_add_fill_callback"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_surface_observer_callback_t | void * 
cairo_surface_observer_add_stroke_callback ⇐ Ffi enum‿"cairo_surface_observer_add_stroke_callback"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_surface_observer_callback_t | void * 
cairo_surface_observer_add_glyphs_callback ⇐ Ffi enum‿"cairo_surface_observer_add_glyphs_callback"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_surface_observer_callback_t | void * 
cairo_surface_observer_add_flush_callback ⇐ Ffi enum‿"cairo_surface_observer_add_flush_callback"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_surface_observer_callback_t | void * 
cairo_surface_observer_add_finish_callback ⇐ Ffi enum‿"cairo_surface_observer_add_finish_callback"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_surface_observer_callback_t | void * 
cairo_surface_observer_print ⇐ Ffi enum‿"cairo_surface_observer_print"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_write_func_t | void * 
cairo_surface_observer_elapsed ⇐ Ffi f64‿"cairo_surface_observer_elapsed"‿ptr
# cairo_public double --| cairo_surface_t * 
cairo_device_observer_print ⇐ Ffi enum‿"cairo_device_observer_print"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_device_t * | cairo_write_func_t | void * 
cairo_device_observer_elapsed ⇐ Ffi f64‿"cairo_device_observer_elapsed"‿ptr
# cairo_public double --| cairo_device_t * 
cairo_device_observer_paint_elapsed ⇐ Ffi f64‿"cairo_device_observer_paint_elapsed"‿ptr
# cairo_public double --| cairo_device_t * 
cairo_device_observer_mask_elapsed ⇐ Ffi f64‿"cairo_device_observer_mask_elapsed"‿ptr
# cairo_public double --| cairo_device_t * 
cairo_device_observer_fill_elapsed ⇐ Ffi f64‿"cairo_device_observer_fill_elapsed"‿ptr
# cairo_public double --| cairo_device_t * 
cairo_device_observer_stroke_elapsed ⇐ Ffi f64‿"cairo_device_observer_stroke_elapsed"‿ptr
# cairo_public double --| cairo_device_t * 
cairo_device_observer_glyphs_elapsed ⇐ Ffi f64‿"cairo_device_observer_glyphs_elapsed"‿ptr
# cairo_public double --| cairo_device_t * 
cairo_surface_reference ⇐ Ffi ptr‿"cairo_surface_reference"‿ptr
# cairo_public cairo_surface_t * --| cairo_surface_t * 
cairo_surface_finish ⇐ Ffi ""‿"cairo_surface_finish"‿ptr
# cairo_public void --| cairo_surface_t * 
cairo_surface_destroy ⇐ Ffi ""‿"cairo_surface_destroy"‿ptr
# cairo_public void --| cairo_surface_t * 
cairo_surface_get_device ⇐ Ffi ptr‿"cairo_surface_get_device"‿ptr
# cairo_public cairo_device_t * --| cairo_surface_t * 
cairo_surface_get_reference_count ⇐ Ffi u32‿"cairo_surface_get_reference_count"‿ptr
# cairo_public unsigned int --| cairo_surface_t * 
cairo_surface_status ⇐ Ffi enum‿"cairo_surface_status"‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * 
cairo_surface_get_type ⇐ Ffi enum‿"cairo_surface_get_type"‿ptr
# cairo_public cairo_surface_type_t --| cairo_surface_t * 
cairo_surface_get_content ⇐ Ffi enum‿"cairo_surface_get_content"‿ptr
# cairo_public cairo_content_t --| cairo_surface_t * 
cairo_surface_write_to_png ⇐ Ffi enum‿"cairo_surface_write_to_png"‿ptr‿str
# cairo_public cairo_status_t --| cairo_surface_t * | const char * 
cairo_surface_write_to_png_stream ⇐ Ffi enum‿"cairo_surface_write_to_png_stream"‿ptr‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_surface_t * | cairo_write_func_t | void * 
cairo_surface_get_user_data ⇐ Ffi ptr‿"cairo_surface_get_user_data"‿ptr‿ptr
# cairo_public void * --| cairo_surface_t * | const cairo_user_data_key_t * 
cairo_surface_get_mime_data ⇐ Ffi ""‿"cairo_surface_get_mime_data"‿ptr‿str‿str‿i64
# cairo_public void --| cairo_surface_t * | const char * | const unsigned char * * | unsigned long * 
cairo_surface_supports_mime_type ⇐ Ffi u32‿"cairo_surface_supports_mime_type"‿ptr‿str
# cairo_public cairo_bool_t --| cairo_surface_t * | const char * 
cairo_surface_get_font_options ⇐ Ffi ""‿"cairo_surface_get_font_options"‿ptr‿ptr
# cairo_public void --| cairo_surface_t * | cairo_font_options_t * 
cairo_surface_flush ⇐ Ffi ""‿"cairo_surface_flush"‿ptr
# cairo_public void --| cairo_surface_t * 
cairo_surface_mark_dirty ⇐ Ffi ""‿"cairo_surface_mark_dirty"‿ptr
# cairo_public void --| cairo_surface_t * 
cairo_surface_mark_dirty_rectangle ⇐ Ffi ""‿"cairo_surface_mark_dirty_rectangle"‿ptr‿i32‿i32‿i32‿i32
# cairo_public void --| cairo_surface_t * | int | int | int | int 
cairo_surface_set_device_scale ⇐ Ffi ""‿"cairo_surface_set_device_scale"‿ptr‿f64‿f64
# cairo_public void --| cairo_surface_t * | double | double 
cairo_surface_get_device_scale ⇐ Ffi ""‿"cairo_surface_get_device_scale"‿ptr‿f64‿f64
# cairo_public void --| cairo_surface_t * | double * | double * 
cairo_surface_set_device_offset ⇐ Ffi ""‿"cairo_surface_set_device_offset"‿ptr‿f64‿f64
# cairo_public void --| cairo_surface_t * | double | double 
cairo_surface_get_device_offset ⇐ Ffi ""‿"cairo_surface_get_device_offset"‿ptr‿f64‿f64
# cairo_public void --| cairo_surface_t * | double * | double * 
cairo_surface_set_fallback_resolution ⇐ Ffi ""‿"cairo_surface_set_fallback_resolution"‿ptr‿f64‿f64
# cairo_public void --| cairo_surface_t * | double | double 
cairo_surface_get_fallback_resolution ⇐ Ffi ""‿"cairo_surface_get_fallback_resolution"‿ptr‿f64‿f64
# cairo_public void --| cairo_surface_t * | double * | double * 
cairo_surface_copy_page ⇐ Ffi ""‿"cairo_surface_copy_page"‿ptr
# cairo_public void --| cairo_surface_t * 
cairo_surface_show_page ⇐ Ffi ""‿"cairo_surface_show_page"‿ptr
# cairo_public void --| cairo_surface_t * 
cairo_surface_has_show_text_glyphs ⇐ Ffi u32‿"cairo_surface_has_show_text_glyphs"‿ptr
# cairo_public cairo_bool_t --| cairo_surface_t * 
cairo_image_surface_create ⇐ Ffi ptr‿"cairo_image_surface_create"‿enum‿i32‿i32
# cairo_public cairo_surface_t * --| cairo_format_t | int | int 
cairo_format_stride_for_width ⇐ Ffi i32‿"cairo_format_stride_for_width"‿enum‿i32
# cairo_public int --| cairo_format_t | int 
cairo_image_surface_create_for_data ⇐ Ffi ptr‿"cairo_image_surface_create_for_data"‿str‿enum‿i32‿i32‿i32
# cairo_public cairo_surface_t * --| unsigned char * | cairo_format_t | int | int | int 
cairo_image_surface_get_data ⇐ Ffi rtn_str‿"cairo_image_surface_get_data"‿ptr
# cairo_public unsigned char * --| cairo_surface_t * 
cairo_image_surface_get_format ⇐ Ffi enum‿"cairo_image_surface_get_format"‿ptr
# cairo_public cairo_format_t --| cairo_surface_t * 
cairo_image_surface_get_width ⇐ Ffi i32‿"cairo_image_surface_get_width"‿ptr
# cairo_public int --| cairo_surface_t * 
cairo_image_surface_get_height ⇐ Ffi i32‿"cairo_image_surface_get_height"‿ptr
# cairo_public int --| cairo_surface_t * 
cairo_image_surface_get_stride ⇐ Ffi i32‿"cairo_image_surface_get_stride"‿ptr
# cairo_public int --| cairo_surface_t * 
cairo_image_surface_create_from_png ⇐ Ffi ptr‿"cairo_image_surface_create_from_png"‿str
# cairo_public cairo_surface_t * --| const char * 
cairo_image_surface_create_from_png_stream ⇐ Ffi ptr‿"cairo_image_surface_create_from_png_stream"‿ptr‿ptr
# cairo_public cairo_surface_t * --| cairo_read_func_t | void * 
cairo_recording_surface_create ⇐ Ffi ptr‿"cairo_recording_surface_create"‿enum‿ptr
# cairo_public cairo_surface_t * --| cairo_content_t | const cairo_rectangle_t * 
cairo_recording_surface_ink_extents ⇐ Ffi ""‿"cairo_recording_surface_ink_extents"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_surface_t * | double * | double * | double * | double * 
cairo_recording_surface_get_extents ⇐ Ffi u32‿"cairo_recording_surface_get_extents"‿ptr‿ptr
# cairo_public cairo_bool_t --| cairo_surface_t * | cairo_rectangle_t * 
cairo_pattern_create_raster_source ⇐ Ffi ptr‿"cairo_pattern_create_raster_source"‿ptr‿enum‿i32‿i32
# cairo_public cairo_pattern_t * --| void * | cairo_content_t | int | int 
cairo_raster_source_pattern_set_callback_data ⇐ Ffi ""‿"cairo_raster_source_pattern_set_callback_data"‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | void * 
cairo_raster_source_pattern_get_callback_data ⇐ Ffi ptr‿"cairo_raster_source_pattern_get_callback_data"‿ptr
# cairo_public void * --| cairo_pattern_t * 
cairo_raster_source_pattern_set_acquire ⇐ Ffi ""‿"cairo_raster_source_pattern_set_acquire"‿ptr‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | cairo_raster_source_acquire_func_t | cairo_raster_source_release_func_t 
cairo_raster_source_pattern_get_acquire ⇐ Ffi ""‿"cairo_raster_source_pattern_get_acquire"‿ptr‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | cairo_raster_source_acquire_func_t * | cairo_raster_source_release_func_t * 
cairo_raster_source_pattern_set_snapshot ⇐ Ffi ""‿"cairo_raster_source_pattern_set_snapshot"‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | cairo_raster_source_snapshot_func_t 
cairo_raster_source_pattern_get_snapshot ⇐ Ffi ptr‿"cairo_raster_source_pattern_get_snapshot"‿ptr
# cairo_public cairo_raster_source_snapshot_func_t --| cairo_pattern_t * 
cairo_raster_source_pattern_set_copy ⇐ Ffi ""‿"cairo_raster_source_pattern_set_copy"‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | cairo_raster_source_copy_func_t 
cairo_raster_source_pattern_get_copy ⇐ Ffi ptr‿"cairo_raster_source_pattern_get_copy"‿ptr
# cairo_public cairo_raster_source_copy_func_t --| cairo_pattern_t * 
cairo_raster_source_pattern_set_finish ⇐ Ffi ""‿"cairo_raster_source_pattern_set_finish"‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | cairo_raster_source_finish_func_t 
cairo_raster_source_pattern_get_finish ⇐ Ffi ptr‿"cairo_raster_source_pattern_get_finish"‿ptr
# cairo_public cairo_raster_source_finish_func_t --| cairo_pattern_t * 
cairo_pattern_create_rgb ⇐ Ffi ptr‿"cairo_pattern_create_rgb"‿f64‿f64‿f64
# cairo_public cairo_pattern_t * --| double | double | double 
cairo_pattern_create_rgba ⇐ Ffi ptr‿"cairo_pattern_create_rgba"‿f64‿f64‿f64‿f64
# cairo_public cairo_pattern_t * --| double | double | double | double 
cairo_pattern_create_for_surface ⇐ Ffi ptr‿"cairo_pattern_create_for_surface"‿ptr
# cairo_public cairo_pattern_t * --| cairo_surface_t * 
cairo_pattern_create_linear ⇐ Ffi ptr‿"cairo_pattern_create_linear"‿f64‿f64‿f64‿f64
# cairo_public cairo_pattern_t * --| double | double | double | double 
cairo_pattern_create_radial ⇐ Ffi ptr‿"cairo_pattern_create_radial"‿f64‿f64‿f64‿f64‿f64‿f64
# cairo_public cairo_pattern_t * --| double | double | double | double | double | double 
cairo_pattern_create_mesh ⇐ Ffi ptr‿"cairo_pattern_create_mesh"
# cairo_public cairo_pattern_t * --
cairo_pattern_reference ⇐ Ffi ptr‿"cairo_pattern_reference"‿ptr
# cairo_public cairo_pattern_t * --| cairo_pattern_t * 
cairo_pattern_destroy ⇐ Ffi ""‿"cairo_pattern_destroy"‿ptr
# cairo_public void --| cairo_pattern_t * 
cairo_pattern_get_reference_count ⇐ Ffi u32‿"cairo_pattern_get_reference_count"‿ptr
# cairo_public unsigned int --| cairo_pattern_t * 
cairo_pattern_status ⇐ Ffi enum‿"cairo_pattern_status"‿ptr
# cairo_public cairo_status_t --| cairo_pattern_t * 
cairo_pattern_get_user_data ⇐ Ffi ptr‿"cairo_pattern_get_user_data"‿ptr‿ptr
# cairo_public void * --| cairo_pattern_t * | const cairo_user_data_key_t * 
cairo_pattern_get_type ⇐ Ffi enum‿"cairo_pattern_get_type"‿ptr
# cairo_public cairo_pattern_type_t --| cairo_pattern_t * 
cairo_pattern_add_color_stop_rgb ⇐ Ffi ""‿"cairo_pattern_add_color_stop_rgb"‿ptr‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_pattern_t * | double | double | double | double 
cairo_pattern_add_color_stop_rgba ⇐ Ffi ""‿"cairo_pattern_add_color_stop_rgba"‿ptr‿f64‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_pattern_t * | double | double | double | double | double 
cairo_mesh_pattern_begin_patch ⇐ Ffi ""‿"cairo_mesh_pattern_begin_patch"‿ptr
# cairo_public void --| cairo_pattern_t * 
cairo_mesh_pattern_end_patch ⇐ Ffi ""‿"cairo_mesh_pattern_end_patch"‿ptr
# cairo_public void --| cairo_pattern_t * 
cairo_mesh_pattern_curve_to ⇐ Ffi ""‿"cairo_mesh_pattern_curve_to"‿ptr‿f64‿f64‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_pattern_t * | double | double | double | double | double | double 
cairo_mesh_pattern_line_to ⇐ Ffi ""‿"cairo_mesh_pattern_line_to"‿ptr‿f64‿f64
# cairo_public void --| cairo_pattern_t * | double | double 
cairo_mesh_pattern_move_to ⇐ Ffi ""‿"cairo_mesh_pattern_move_to"‿ptr‿f64‿f64
# cairo_public void --| cairo_pattern_t * | double | double 
cairo_mesh_pattern_set_control_point ⇐ Ffi ""‿"cairo_mesh_pattern_set_control_point"‿ptr‿u32‿f64‿f64
# cairo_public void --| cairo_pattern_t * | unsigned int | double | double 
cairo_mesh_pattern_set_corner_color_rgb ⇐ Ffi ""‿"cairo_mesh_pattern_set_corner_color_rgb"‿ptr‿u32‿f64‿f64‿f64
# cairo_public void --| cairo_pattern_t * | unsigned int | double | double | double 
cairo_mesh_pattern_set_corner_color_rgba ⇐ Ffi ""‿"cairo_mesh_pattern_set_corner_color_rgba"‿ptr‿u32‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_pattern_t * | unsigned int | double | double | double | double 
cairo_pattern_set_matrix ⇐ Ffi ""‿"cairo_pattern_set_matrix"‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | const cairo_matrix_t * 
cairo_pattern_get_matrix ⇐ Ffi ""‿"cairo_pattern_get_matrix"‿ptr‿ptr
# cairo_public void --| cairo_pattern_t * | cairo_matrix_t * 
cairo_pattern_set_extend ⇐ Ffi ""‿"cairo_pattern_set_extend"‿ptr‿enum
# cairo_public void --| cairo_pattern_t * | cairo_extend_t 
cairo_pattern_get_extend ⇐ Ffi enum‿"cairo_pattern_get_extend"‿ptr
# cairo_public cairo_extend_t --| cairo_pattern_t * 
cairo_pattern_set_filter ⇐ Ffi ""‿"cairo_pattern_set_filter"‿ptr‿enum
# cairo_public void --| cairo_pattern_t * | cairo_filter_t 
cairo_pattern_get_filter ⇐ Ffi enum‿"cairo_pattern_get_filter"‿ptr
# cairo_public cairo_filter_t --| cairo_pattern_t * 
cairo_pattern_get_rgba ⇐ Ffi enum‿"cairo_pattern_get_rgba"‿ptr‿f64‿f64‿f64‿f64
# cairo_public cairo_status_t --| cairo_pattern_t * | double * | double * | double * | double * 
cairo_pattern_get_surface ⇐ Ffi enum‿"cairo_pattern_get_surface"‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_pattern_t * | cairo_surface_t * * 
cairo_pattern_get_color_stop_rgba ⇐ Ffi enum‿"cairo_pattern_get_color_stop_rgba"‿ptr‿i32‿f64‿f64‿f64‿f64‿f64
# cairo_public cairo_status_t --| cairo_pattern_t * | int | double * | double * | double * | double * | double * 
cairo_pattern_get_color_stop_count ⇐ Ffi enum‿"cairo_pattern_get_color_stop_count"‿ptr‿i32
# cairo_public cairo_status_t --| cairo_pattern_t * | int * 
cairo_pattern_get_linear_points ⇐ Ffi enum‿"cairo_pattern_get_linear_points"‿ptr‿f64‿f64‿f64‿f64
# cairo_public cairo_status_t --| cairo_pattern_t * | double * | double * | double * | double * 
cairo_pattern_get_radial_circles ⇐ Ffi enum‿"cairo_pattern_get_radial_circles"‿ptr‿f64‿f64‿f64‿f64‿f64‿f64
# cairo_public cairo_status_t --| cairo_pattern_t * | double * | double * | double * | double * | double * | double * 
cairo_mesh_pattern_get_patch_count ⇐ Ffi enum‿"cairo_mesh_pattern_get_patch_count"‿ptr‿u32
# cairo_public cairo_status_t --| cairo_pattern_t * | unsigned int * 
cairo_mesh_pattern_get_path ⇐ Ffi ptr‿"cairo_mesh_pattern_get_path"‿ptr‿u32
# cairo_public cairo_path_t * --| cairo_pattern_t * | unsigned int 
cairo_mesh_pattern_get_corner_color_rgba ⇐ Ffi enum‿"cairo_mesh_pattern_get_corner_color_rgba"‿ptr‿u32‿u32‿f64‿f64‿f64‿f64
# cairo_public cairo_status_t --| cairo_pattern_t * | unsigned int | unsigned int | double * | double * | double * | double * 
cairo_mesh_pattern_get_control_point ⇐ Ffi enum‿"cairo_mesh_pattern_get_control_point"‿ptr‿u32‿u32‿f64‿f64
# cairo_public cairo_status_t --| cairo_pattern_t * | unsigned int | unsigned int | double * | double * 
cairo_matrix_init ⇐ Ffi ""‿"cairo_matrix_init"‿ptr‿f64‿f64‿f64‿f64‿f64‿f64
# cairo_public void --| cairo_matrix_t * | double | double | double | double | double | double 
cairo_matrix_init_identity ⇐ Ffi ""‿"cairo_matrix_init_identity"‿ptr
# cairo_public void --| cairo_matrix_t * 
cairo_matrix_init_translate ⇐ Ffi ""‿"cairo_matrix_init_translate"‿ptr‿f64‿f64
# cairo_public void --| cairo_matrix_t * | double | double 
cairo_matrix_init_scale ⇐ Ffi ""‿"cairo_matrix_init_scale"‿ptr‿f64‿f64
# cairo_public void --| cairo_matrix_t * | double | double 
cairo_matrix_init_rotate ⇐ Ffi ""‿"cairo_matrix_init_rotate"‿ptr‿f64
# cairo_public void --| cairo_matrix_t * | double 
cairo_matrix_translate ⇐ Ffi ""‿"cairo_matrix_translate"‿ptr‿f64‿f64
# cairo_public void --| cairo_matrix_t * | double | double 
cairo_matrix_scale ⇐ Ffi ""‿"cairo_matrix_scale"‿ptr‿f64‿f64
# cairo_public void --| cairo_matrix_t * | double | double 
cairo_matrix_rotate ⇐ Ffi ""‿"cairo_matrix_rotate"‿ptr‿f64
# cairo_public void --| cairo_matrix_t * | double 
cairo_matrix_invert ⇐ Ffi enum‿"cairo_matrix_invert"‿ptr
# cairo_public cairo_status_t --| cairo_matrix_t * 
cairo_matrix_multiply ⇐ Ffi ""‿"cairo_matrix_multiply"‿ptr‿ptr‿ptr
# cairo_public void --| cairo_matrix_t * | const cairo_matrix_t * | const cairo_matrix_t * 
cairo_matrix_transform_distance ⇐ Ffi ""‿"cairo_matrix_transform_distance"‿ptr‿f64‿f64
# cairo_public void --| const cairo_matrix_t * | double * | double * 
cairo_matrix_transform_point ⇐ Ffi ""‿"cairo_matrix_transform_point"‿ptr‿f64‿f64
# cairo_public void --| const cairo_matrix_t * | double * | double * 
cairo_region_create ⇐ Ffi ptr‿"cairo_region_create"
# cairo_public cairo_region_t * --
cairo_region_create_rectangle ⇐ Ffi ptr‿"cairo_region_create_rectangle"‿i32
# cairo_public cairo_region_t * --| const cairo_rectangle_int_t * 
cairo_region_create_rectangles ⇐ Ffi ptr‿"cairo_region_create_rectangles"‿i32‿i32
# cairo_public cairo_region_t * --| const cairo_rectangle_int_t * | int 
cairo_region_copy ⇐ Ffi ptr‿"cairo_region_copy"‿ptr
# cairo_public cairo_region_t * --| const cairo_region_t * 
cairo_region_reference ⇐ Ffi ptr‿"cairo_region_reference"‿ptr
# cairo_public cairo_region_t * --| cairo_region_t * 
cairo_region_destroy ⇐ Ffi ""‿"cairo_region_destroy"‿ptr
# cairo_public void --| cairo_region_t * 
cairo_region_equal ⇐ Ffi u32‿"cairo_region_equal"‿ptr‿ptr
# cairo_public cairo_bool_t --| const cairo_region_t * | const cairo_region_t * 
cairo_region_status ⇐ Ffi enum‿"cairo_region_status"‿ptr
# cairo_public cairo_status_t --| const cairo_region_t * 
cairo_region_get_extents ⇐ Ffi ""‿"cairo_region_get_extents"‿ptr‿i32
# cairo_public void --| const cairo_region_t * | cairo_rectangle_int_t * 
cairo_region_num_rectangles ⇐ Ffi i32‿"cairo_region_num_rectangles"‿ptr
# cairo_public int --| const cairo_region_t * 
cairo_region_get_rectangle ⇐ Ffi ""‿"cairo_region_get_rectangle"‿ptr‿i32‿i32
# cairo_public void --| const cairo_region_t * | int | cairo_rectangle_int_t * 
cairo_region_is_empty ⇐ Ffi u32‿"cairo_region_is_empty"‿ptr
# cairo_public cairo_bool_t --| const cairo_region_t * 
cairo_region_contains_rectangle ⇐ Ffi enum‿"cairo_region_contains_rectangle"‿ptr‿i32
# cairo_public cairo_region_overlap_t --| const cairo_region_t * | const cairo_rectangle_int_t * 
cairo_region_contains_point ⇐ Ffi u32‿"cairo_region_contains_point"‿ptr‿i32‿i32
# cairo_public cairo_bool_t --| const cairo_region_t * | int | int 
cairo_region_translate ⇐ Ffi ""‿"cairo_region_translate"‿ptr‿i32‿i32
# cairo_public void --| cairo_region_t * | int | int 
cairo_region_subtract ⇐ Ffi enum‿"cairo_region_subtract"‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_region_t * 
cairo_region_subtract_rectangle ⇐ Ffi enum‿"cairo_region_subtract_rectangle"‿ptr‿i32
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_rectangle_int_t * 
cairo_region_intersect ⇐ Ffi enum‿"cairo_region_intersect"‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_region_t * 
cairo_region_intersect_rectangle ⇐ Ffi enum‿"cairo_region_intersect_rectangle"‿ptr‿i32
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_rectangle_int_t * 
cairo_region_union ⇐ Ffi enum‿"cairo_region_union"‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_region_t * 
cairo_region_union_rectangle ⇐ Ffi enum‿"cairo_region_union_rectangle"‿ptr‿i32
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_rectangle_int_t * 
cairo_region_xor ⇐ Ffi enum‿"cairo_region_xor"‿ptr‿ptr
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_region_t * 
cairo_region_xor_rectangle ⇐ Ffi enum‿"cairo_region_xor_rectangle"‿ptr‿i32
# cairo_public cairo_status_t --| cairo_region_t * | const cairo_rectangle_int_t * 
cairo_debug_reset_static_data ⇐ Ffi ""‿"cairo_debug_reset_static_data"
# cairo_public void --

# cairo_status_t
cairo_status_success ⇐ 0
cairo_status_no_memory ⇐ 1
cairo_status_invalid_restore ⇐ 2
cairo_status_invalid_pop_group ⇐ 3
cairo_status_no_current_point ⇐ 4
cairo_status_invalid_matrix ⇐ 5
cairo_status_invalid_status ⇐ 6
cairo_status_null_pointer ⇐ 7
cairo_status_invalid_string ⇐ 8
cairo_status_invalid_path_data ⇐ 9
cairo_status_read_error ⇐ 10
cairo_status_write_error ⇐ 11
cairo_status_surface_finished ⇐ 12
cairo_status_surface_type_mismatch ⇐ 13
cairo_status_pattern_type_mismatch ⇐ 14
cairo_status_invalid_content ⇐ 15
cairo_status_invalid_format ⇐ 16
cairo_status_invalid_visual ⇐ 17
cairo_status_file_not_found ⇐ 18
cairo_status_invalid_dash ⇐ 19
cairo_status_invalid_dsc_comment ⇐ 20
cairo_status_invalid_index ⇐ 21
cairo_status_clip_not_representable ⇐ 22
cairo_status_temp_file_error ⇐ 23
cairo_status_invalid_stride ⇐ 24
cairo_status_font_type_mismatch ⇐ 25
cairo_status_user_font_immutable ⇐ 26
cairo_status_user_font_error ⇐ 27
cairo_status_negative_count ⇐ 28
cairo_status_invalid_clusters ⇐ 29
cairo_status_invalid_slant ⇐ 30
cairo_status_invalid_weight ⇐ 31
cairo_status_invalid_size ⇐ 32
cairo_status_user_font_not_implemented ⇐ 33
cairo_status_device_type_mismatch ⇐ 34
cairo_status_device_error ⇐ 35
cairo_status_invalid_mesh_construction ⇐ 36
cairo_status_device_finished ⇐ 37
cairo_status_jbig2_global_missing ⇐ 38
cairo_status_png_error ⇐ 39
cairo_status_freetype_error ⇐ 40
cairo_status_win32_gdi_error ⇐ 41
cairo_status_tag_error ⇐ 42
cairo_status_dwrite_error ⇐ 43
cairo_status_svg_font_error ⇐ 44
cairo_status_last_status ⇐ 45

# cairo_content_t
cairo_content_color ⇐ 4096
cairo_content_alpha ⇐ 8192
cairo_content_color_alpha ⇐ 12288

# cairo_format_t
cairo_format_invalid ⇐ - 1
cairo_format_argb32 ⇐ 0
cairo_format_rgb24 ⇐ 1
cairo_format_a8 ⇐ 2
cairo_format_a1 ⇐ 3
cairo_format_rgb16_565 ⇐ 4
cairo_format_rgb30 ⇐ 5
cairo_format_rgb96f ⇐ 6
cairo_format_rgba128f ⇐ 7

# cairo_operator_t
cairo_operator_clear ⇐ 0
cairo_operator_source ⇐ 1
cairo_operator_over ⇐ 2
cairo_operator_in ⇐ 3
cairo_operator_out ⇐ 4
cairo_operator_atop ⇐ 5
cairo_operator_dest ⇐ 6
cairo_operator_dest_over ⇐ 7
cairo_operator_dest_in ⇐ 8
cairo_operator_dest_out ⇐ 9
cairo_operator_dest_atop ⇐ 10
cairo_operator_xor ⇐ 11
cairo_operator_add ⇐ 12
cairo_operator_saturate ⇐ 13
cairo_operator_multiply ⇐ 14
cairo_operator_screen ⇐ 15
cairo_operator_overlay ⇐ 16
cairo_operator_darken ⇐ 17
cairo_operator_lighten ⇐ 18
cairo_operator_color_dodge ⇐ 19
cairo_operator_color_burn ⇐ 20
cairo_operator_hard_light ⇐ 21
cairo_operator_soft_light ⇐ 22
cairo_operator_difference ⇐ 23
cairo_operator_exclusion ⇐ 24
cairo_operator_hsl_hue ⇐ 25
cairo_operator_hsl_saturation ⇐ 26
cairo_operator_hsl_color ⇐ 27
cairo_operator_hsl_luminosity ⇐ 28

# cairo_antialias_t
cairo_antialias_default ⇐ 0
cairo_antialias_none ⇐ 1
cairo_antialias_gray ⇐ 2
cairo_antialias_subpixel ⇐ 3
cairo_antialias_fast ⇐ 4
cairo_antialias_good ⇐ 5
cairo_antialias_best ⇐ 6

# cairo_fill_rule_t
cairo_fill_rule_winding ⇐ 0
cairo_fill_rule_even_odd ⇐ 1

# cairo_line_cap_t
cairo_line_cap_butt ⇐ 0
cairo_line_cap_round ⇐ 1
cairo_line_cap_square ⇐ 2

# cairo_line_join_t
cairo_line_join_miter ⇐ 0
cairo_line_join_round ⇐ 1
cairo_line_join_bevel ⇐ 2

# cairo_text_cluster_flags_t
cairo_text_cluster_flag_backward ⇐ 1

# cairo_font_slant_t
cairo_font_slant_normal ⇐ 0
cairo_font_slant_italic ⇐ 1
cairo_font_slant_oblique ⇐ 2

# cairo_font_weight_t
cairo_font_weight_normal ⇐ 0
cairo_font_weight_bold ⇐ 1

# cairo_subpixel_order_t
cairo_subpixel_order_default ⇐ 0
cairo_subpixel_order_rgb ⇐ 1
cairo_subpixel_order_bgr ⇐ 2
cairo_subpixel_order_vrgb ⇐ 3
cairo_subpixel_order_vbgr ⇐ 4

# cairo_hint_style_t
cairo_hint_style_default ⇐ 0
cairo_hint_style_none ⇐ 1
cairo_hint_style_slight ⇐ 2
cairo_hint_style_medium ⇐ 3
cairo_hint_style_full ⇐ 4

# cairo_hint_metrics_t
cairo_hint_metrics_default ⇐ 0
cairo_hint_metrics_off ⇐ 1
cairo_hint_metrics_on ⇐ 2

# cairo_color_mode_t
cairo_color_mode_default ⇐ 0
cairo_color_mode_no_color ⇐ 1
cairo_color_mode_color ⇐ 2

# cairo_font_type_t
cairo_font_type_toy ⇐ 0
cairo_font_type_ft ⇐ 1
cairo_font_type_win32 ⇐ 2
cairo_font_type_quartz ⇐ 3
cairo_font_type_user ⇐ 4
cairo_font_type_dwrite ⇐ 5

# cairo_path_data_type_t
cairo_path_move_to ⇐ 0
cairo_path_line_to ⇐ 1
cairo_path_curve_to ⇐ 2
cairo_path_close_path ⇐ 3

# cairo_device_type_t
cairo_device_type_drm ⇐ 0
cairo_device_type_gl ⇐ 1
cairo_device_type_script ⇐ 2
cairo_device_type_xcb ⇐ 3
cairo_device_type_xlib ⇐ 4
cairo_device_type_xml ⇐ 5
cairo_device_type_cogl ⇐ 6
cairo_device_type_win32 ⇐ 7
cairo_device_type_invalid ⇐ - 1

# cairo_surface_observer_mode_t
cairo_surface_observer_normal ⇐ 0
cairo_surface_observer_record_operations ⇐ 1

# cairo_surface_type_t
cairo_surface_type_image ⇐ 0
cairo_surface_type_pdf ⇐ 1
cairo_surface_type_ps ⇐ 2
cairo_surface_type_xlib ⇐ 3
cairo_surface_type_xcb ⇐ 4
cairo_surface_type_glitz ⇐ 5
cairo_surface_type_quartz ⇐ 6
cairo_surface_type_win32 ⇐ 7
cairo_surface_type_beos ⇐ 8
cairo_surface_type_directfb ⇐ 9
cairo_surface_type_svg ⇐ 10
cairo_surface_type_os2 ⇐ 11
cairo_surface_type_win32_printing ⇐ 12
cairo_surface_type_quartz_image ⇐ 13
cairo_surface_type_script ⇐ 14
cairo_surface_type_qt ⇐ 15
cairo_surface_type_recording ⇐ 16
cairo_surface_type_vg ⇐ 17
cairo_surface_type_gl ⇐ 18
cairo_surface_type_drm ⇐ 19
cairo_surface_type_tee ⇐ 20
cairo_surface_type_xml ⇐ 21
cairo_surface_type_skia ⇐ 22
cairo_surface_type_subsurface ⇐ 23
cairo_surface_type_cogl ⇐ 24

# cairo_pattern_type_t
cairo_pattern_type_solid ⇐ 0
cairo_pattern_type_surface ⇐ 1
cairo_pattern_type_linear ⇐ 2
cairo_pattern_type_radial ⇐ 3
cairo_pattern_type_mesh ⇐ 4
cairo_pattern_type_raster_source ⇐ 5

# cairo_extend_t
cairo_extend_none ⇐ 0
cairo_extend_repeat ⇐ 1
cairo_extend_reflect ⇐ 2
cairo_extend_pad ⇐ 3

# cairo_filter_t
cairo_filter_fast ⇐ 0
cairo_filter_good ⇐ 1
cairo_filter_best ⇐ 2
cairo_filter_nearest ⇐ 3
cairo_filter_bilinear ⇐ 4
cairo_filter_gaussian ⇐ 5

# cairo_region_overlap_t
cairo_region_overlap_in ⇐ 0
cairo_region_overlap_out ⇐ 1
cairo_region_overlap_part ⇐ 2

