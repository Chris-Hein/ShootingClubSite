<?php

/* theme-options/bootstrap_tabs.twig */
class __TwigTemplate_788a05e53df23570bd080700c3d94ab1071e6da70305581541040dbcedef230f extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = $this->env->loadTemplate("bootstrap_tabs.twig");

        $this->blocks = array(
            'extra_html' => array($this, 'block_extra_html'),
        );
    }

    protected function doGetParent(array $context)
    {
        return "bootstrap_tabs.twig";
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        $this->parent->display($context, array_merge($this->blocks, $blocks));
    }

    // line 2
    public function block_extra_html($context, array $blocks = array())
    {
        // line 3
        echo "\t";
        $context["__internal_d32dd8ab9776b6db8bd5185ca94eba73eef59582e7cc3eb64e267fbdc7cf4c36"] = $this->env->loadTemplate("form-elements/input.twig");
        // line 4
        echo "\t<div class=\"ai1ec-text-right\">
\t\t<div class=\"ai1ec-btn-toolbar\">
\t\t\t";
        // line 6
        echo $context["__internal_d32dd8ab9776b6db8bd5185ca94eba73eef59582e7cc3eb64e267fbdc7cf4c36"]->getbutton($this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "id"), $this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "id"), $this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "value"), "submit", $this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "args"));
        echo "
\t\t\t";
        // line 7
        echo $context["__internal_d32dd8ab9776b6db8bd5185ca94eba73eef59582e7cc3eb64e267fbdc7cf4c36"]->getbutton($this->getAttribute((isset($context["reset"]) ? $context["reset"] : null), "id"), $this->getAttribute((isset($context["reset"]) ? $context["reset"] : null), "id"), $this->getAttribute((isset($context["reset"]) ? $context["reset"] : null), "value"), "submit", $this->getAttribute((isset($context["reset"]) ? $context["reset"] : null), "args"));
        echo "
\t\t</div>
\t</div>
";
    }

    public function getTemplateName()
    {
        return "theme-options/bootstrap_tabs.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  36 => 5,  30 => 3,  42 => 7,  38 => 6,  35 => 5,  25 => 2,  39 => 5,  32 => 4,  27 => 3,  23 => 2,  20 => 1,  58 => 12,  51 => 10,  45 => 9,  41 => 8,  37 => 7,  33 => 4,  34 => 4,  31 => 3,  28 => 2,);
    }
}
