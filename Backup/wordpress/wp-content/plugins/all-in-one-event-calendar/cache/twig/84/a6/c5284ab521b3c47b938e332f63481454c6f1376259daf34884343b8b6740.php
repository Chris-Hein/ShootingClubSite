<?php

/* setting/page.twig */
class __TwigTemplate_84a6c5284ab521b3c47b938e332f63481454c6f1376259daf34884343b8b6740 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = $this->env->loadTemplate("base_page.twig");

        $this->blocks = array(
            'layout' => array($this, 'block_layout'),
        );
    }

    protected function doGetParent(array $context)
    {
        return "base_page.twig";
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        $this->parent->display($context, array_merge($this->blocks, $blocks));
    }

    // line 2
    public function block_layout($context, array $blocks = array())
    {
        // line 3
        echo "<div class=\"post-box-container column-1-ai1ec left-side timely\">
\t";
        // line 4
        echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->do_meta_boxes($this->getAttribute((isset($context["metabox"]) ? $context["metabox"] : null), "screen"), $this->getAttribute((isset($context["metabox"]) ? $context["metabox"] : null), "action"), $this->getAttribute((isset($context["metabox"]) ? $context["metabox"] : null), "object")), "html", null, true);
        echo "
\t";
        // line 5
        if (array_key_exists("submit", $context)) {
            // line 6
            echo "\t\t";
            $context["__internal_f45b51761c1cf5ba09362c0e146f07cf718cb86a41085c10a52ee438b238c50a"] = $this->env->loadTemplate("form-elements/input.twig");
            // line 7
            echo "\t\t<div class=\"ai1ec-pull-right\">
\t\t\t";
            // line 8
            echo $context["__internal_f45b51761c1cf5ba09362c0e146f07cf718cb86a41085c10a52ee438b238c50a"]->getbutton($this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "id"), $this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "id"), $this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "value"), "submit", $this->getAttribute((isset($context["submit"]) ? $context["submit"] : null), "args"));
            echo "
\t\t</div>
\t";
        }
        // line 11
        echo "</div>
<div class=\"post-box-container column-2-ai1ec right-side timely\">
\t\t";
        // line 13
        echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->do_meta_boxes($this->getAttribute((isset($context["support"]) ? $context["support"] : null), "screen"), $this->getAttribute((isset($context["support"]) ? $context["support"] : null), "action"), $this->getAttribute((isset($context["support"]) ? $context["support"] : null), "object")), "html", null, true);
        echo "
</div>
";
    }

    public function getTemplateName()
    {
        return "setting/page.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  56 => 13,  52 => 11,  46 => 8,  43 => 7,  40 => 6,  38 => 5,  34 => 4,  31 => 3,  28 => 2,);
    }
}
