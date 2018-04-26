<?php

/* theme-options/font.twig */
class __TwigTemplate_a91319c0dfb246b83d124903c9581b3f14a0318358047403bfc7cad6e9700131 extends Twig_Template
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
        $context["__internal_68b0dee7e460b40ce20a3dabf1ea7b1846251a806cc6fa6e3488980460bba8c4"] = $this->env->loadTemplate("form-elements/select.twig");
        // line 3
        $context["__internal_e829a191ffcab5d765f4240af605e9c8bac189f4a4322f9c0de27d0a5f609dd2"] = $this->env->loadTemplate("form-elements/input.twig");
        $this->parent->display($context, array_merge($this->blocks, $blocks));
    }

    // line 4
    public function block_variable($context, array $blocks = array())
    {
        // line 5
        echo "  <div class=\"ai1ec-col-sm-6 ai1ec-col-xs-9\">
    ";
        // line 6
        echo $context["__internal_68b0dee7e460b40ce20a3dabf1ea7b1846251a806cc6fa6e3488980460bba8c4"]->getselect($this->getAttribute((isset($context["select"]) ? $context["select"] : null), "id"), $this->getAttribute((isset($context["select"]) ? $context["select"] : null), "id"), $this->getAttribute((isset($context["select"]) ? $context["select"] : null), "args"), $this->getAttribute((isset($context["select"]) ? $context["select"] : null), "options"));
        echo "
    ";
        // line 7
        echo $context["__internal_e829a191ffcab5d765f4240af605e9c8bac189f4a4322f9c0de27d0a5f609dd2"]->getinput($this->getAttribute((isset($context["input"]) ? $context["input"] : null), "id"), $this->getAttribute((isset($context["input"]) ? $context["input"] : null), "id"), $this->getAttribute((isset($context["input"]) ? $context["input"] : null), "value"), "text", $this->getAttribute((isset($context["input"]) ? $context["input"] : null), "args"));
        echo "
  </div>
";
    }

    public function getTemplateName()
    {
        return "theme-options/font.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  42 => 7,  38 => 6,  35 => 5,  25 => 2,  39 => 5,  32 => 4,  27 => 3,  23 => 2,  20 => 1,  58 => 12,  51 => 10,  45 => 9,  41 => 8,  37 => 7,  33 => 5,  34 => 6,  31 => 4,  28 => 3,);
    }
}
