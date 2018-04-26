<?php

/* theme-options/size.twig */
class __TwigTemplate_297c22cf4b28b843eda5f8c8ca70af2a80893c025887b7d169135a123b9d4c73 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = $this->env->loadTemplate("theme-options/base_option.twig");

        $this->blocks = array(
            'variable' => array($this, 'block_variable'),
        );
    }

    protected function doGetParent(array $context)
    {
        return "theme-options/base_option.twig";
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 2
        $context["__internal_0167b8542798d6728f35b2ed75cc68b5d5ba7ecb1fd6f9c4e9ee8c0bee5f8207"] = $this->env->loadTemplate("form-elements/input.twig");
        $this->parent->display($context, array_merge($this->blocks, $blocks));
    }

    // line 3
    public function block_variable($context, array $blocks = array())
    {
        // line 4
        echo "  <div class=\"ai1ec-col-sm-6 ai1ec-col-xs-9\">
    ";
        // line 5
        echo $context["__internal_0167b8542798d6728f35b2ed75cc68b5d5ba7ecb1fd6f9c4e9ee8c0bee5f8207"]->getinput((isset($context["id"]) ? $context["id"] : null), (isset($context["id"]) ? $context["id"] : null), (isset($context["value"]) ? $context["value"] : null), "text", (isset($context["args"]) ? $context["args"] : null));
        echo "
  </div>
";
    }

    public function getTemplateName()
    {
        return "theme-options/size.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  36 => 5,  30 => 3,  42 => 7,  38 => 6,  35 => 5,  25 => 2,  39 => 5,  32 => 4,  27 => 3,  23 => 2,  20 => 1,  58 => 12,  51 => 10,  45 => 9,  41 => 8,  37 => 7,  33 => 4,  34 => 6,  31 => 4,  28 => 3,);
    }
}
