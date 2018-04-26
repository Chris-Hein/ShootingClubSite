<?php

/* widget-creator/page.twig */
class __TwigTemplate_e899403e3822a81b09e1353e7f59c289e98765518f100d96487c0db3f3f06c8d extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<div class=\"wrap\">
\t<h2>";
        // line 2
        echo twig_escape_filter($this->env, (isset($context["title"]) ? $context["title"] : null), "html", null, true);
        echo "</h2>
\t<div id=\"poststuff\">
\t\t<div class=\"metabox-holder\">
\t\t\t<div class=\"post-box-container left-side timely\">
\t\t\t\t<div class=\"ai1ec-tab-content-container ai1ec-form-horizontal\">
\t\t\t\t";
        // line 7
        echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->do_meta_boxes($this->getAttribute((isset($context["metabox"]) ? $context["metabox"] : null), "screen"), $this->getAttribute((isset($context["metabox"]) ? $context["metabox"] : null), "action"), $this->getAttribute((isset($context["metabox"]) ? $context["metabox"] : null), "object")), "html", null, true);
        echo "
\t\t\t\t</div>
\t\t\t</div>
\t\t</div>
\t</div>";
        // line 12
        echo "</div>";
    }

    public function getTemplateName()
    {
        return "widget-creator/page.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  37 => 12,  30 => 7,  22 => 2,  19 => 1,);
    }
}
