FUNCTION render_nprogress(p_dynamic_action IN apex_plugin.t_dynamic_action,
                          p_plugin         IN apex_plugin.t_plugin)
  RETURN apex_plugin.t_dynamic_action_render_result IS
  --
  v_start_stop     VARCHAR2(5) := p_dynamic_action.attribute_01;
  v_show_spinner   VARCHAR2(5) := p_dynamic_action.attribute_02;
  v_parent_element VARCHAR2(50) := NVL(p_dynamic_action.attribute_03, 'body');
  --
  l_result apex_plugin.t_dynamic_action_render_result;
  --
  v_nprogress_js_call VARCHAR2(300);
  v_nprogress_options VARCHAR2(200);
BEGIN
  IF apex_application.g_debug THEN
    apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,
                                          p_dynamic_action => p_dynamic_action);
  END IF;
  --
  -- CSS
  apex_css.add_file(p_name      => 'nprogress.min',
                    p_directory => p_plugin.file_prefix);
  --
  -- JS
  apex_javascript.add_library(p_name           => 'nprogress.min',
                              p_directory      => p_plugin.file_prefix,
                              p_version        => NULL,
                              p_skip_extension => FALSE);

  v_nprogress_options := '{ ' ||
      apex_javascript.add_attribute(
         p_name      => 'showSpinner',
         p_value     => v_show_spinner,
       p_add_comma => TRUE) ||
      apex_javascript.add_attribute(
         p_name      => 'parent',
         p_value     => v_parent_element,
       p_add_comma => FALSE) ||
  '} ';

  v_nprogress_options :=
  REPLACE(
   REPLACE(
      v_nprogress_options,
        '"true"',
        'true'
    ),
    '"false"',
    'false'
  );

  IF v_start_stop = 'START' THEN
    v_nprogress_js_call := 'function() { ' ||
      'NProgress.configure(' || v_nprogress_options || '); ' ||
      'NProgress.start(); ' ||
    '}';
  ELSIF v_start_stop = 'STOP' THEN
    v_nprogress_js_call := 'function() { ' ||
      'NProgress.done(); ' ||
    '}';
  END IF;
  --
  l_result.javascript_function := v_nprogress_js_call;
  --
  RETURN l_result;
  --
END render_nprogress;