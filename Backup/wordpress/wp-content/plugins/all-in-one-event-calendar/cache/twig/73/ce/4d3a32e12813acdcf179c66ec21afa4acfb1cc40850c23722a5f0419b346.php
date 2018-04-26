<?php

/* setting/input.twig */
class __TwigTemplate_73ce4d3a32e12813acdcf179c66ec21afa4acfb1cc40850c23722a5f0419b346 extends Twig_Template
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
        echo "<label class=\"ai1ec-control-label ai1ec-col-sm-5\" for=\"";
        echo twig_escape_filter($this->env, (isset($context["id"]) ? $context["id"] : null), "html", null, true);
        echo "\">
\t";
        // line 2
        echo (isset($context["label"]) ? $context["label"] : null);
        echo "
</label>
";
        // line 4
        if ((array_key_exists("append", $context) || array_key_exists("licence_valid", $context))) {
            // line 5
            echo "\t<div class=\"";
            echo twig_escape_filter($this->env, ((array_key_exists("group_class", $context)) ? ((isset($context["group_class"]) ? $context["group_class"] : null)) : ("ai1ec-col-lg-3 ai1ec-col-md-4 ai1ec-col-sm-5")), "html", null, true);
            // line 6
            echo "\">
\t\t<div class=\"ai1ec-input-group\">
";
        } else {
            // line 9
            echo "\t<div class=\"ai1ec-col-sm-7\">
";
        }
        // line 11
        echo "
\t";
        // line 12
        $context["__internal_47ad499d5b73c37ea9e88ba3e4e5e4d7e061108c0a4f4b11213d3e14f9af6bbd"] = $this->env->loadTemplate("form-elements/input.twig");
        // line 13
        echo "\t";
        ob_start();
        // line 14
        echo "\t";
        echo $context["__internal_47ad499d5b73c37ea9e88ba3e4e5e4d7e061108c0a4f4b11213d3e14f9af6bbd"]->getinput((isset($context["id"]) ? $context["id"] : null), (isset($context["id"]) ? $context["id"] : null), (isset($context["value"]) ? $context["value"] : null), (isset($context["input_type"]) ? $context["input_type"] : null), (isset($context["input_args"]) ? $context["input_args"] : null));
        echo "


\t";
        // line 17
        if (array_key_exists("append", $context)) {
            // line 18
            echo "\t\t\t<span class=\"ai1ec-input-group-addon\">";
            echo twig_escape_filter($this->env, (isset($context["append"]) ? $context["append"] : null), "html", null, true);
            echo "</span>
\t\t</div>
\t";
        } elseif (array_key_exists("licence_valid", $context)) {
            // line 21
            echo "\t\t\t<span class=\"ai1ec-input-group-addon\">
\t\t\t\t<i class=\"ai1ec-fa
\t\t\t\t\t";
            // line 23
            if ((isset($context["licence_valid"]) ? $context["licence_valid"] : null)) {
                // line 24
                echo "\t\t\t\t\t\tai1ec-fa-check ai1ec-text-success
\t\t\t\t\t";
            } else {
                // line 26
                echo "\t\t\t\t\t\tai1ec-fa-times ai1ec-text-danger
\t\t\t\t\t";
            }
            // line 27
            echo "\">
\t\t\t\t</i>
\t\t\t</span>
\t\t</div>
\t";
        }
        // line 32
        echo "\t";
        echo trim(preg_replace('/>\s+</', '><', ob_get_clean()));
        // line 33
        echo "</div>

";
        // line 35
        if (array_key_exists("help", $context)) {
            // line 36
            echo "\t<div class=\"ai1ec-col-sm-12 ai1ec-help-block\">";
            echo (isset($context["help"]) ? $context["help"] : null);
            echo "</div>
";
        }
    }

    public function getTemplateName()
    {
        return "setting/input.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  91 => 33,  88 => 32,  81 => 27,  77 => 26,  73 => 24,  58 => 17,  29 => 4,  129 => 53,  119 => 49,  115 => 48,  108 => 44,  104 => 43,  97 => 36,  93 => 38,  86 => 34,  82 => 33,  75 => 29,  71 => 23,  67 => 21,  60 => 18,  48 => 13,  33 => 10,  22 => 2,  24 => 2,  168 => 36,  162 => 35,  156 => 33,  145 => 31,  141 => 30,  137 => 29,  134 => 28,  130 => 26,  121 => 24,  110 => 22,  106 => 21,  102 => 20,  99 => 19,  95 => 35,  90 => 17,  87 => 16,  83 => 15,  80 => 14,  74 => 13,  66 => 11,  63 => 10,  59 => 9,  55 => 8,  44 => 5,  21 => 1,  51 => 14,  49 => 9,  41 => 4,  35 => 2,  30 => 3,  26 => 2,  19 => 1,  47 => 6,  39 => 9,  37 => 7,  32 => 5,  23 => 2,  20 => 1,  56 => 21,  52 => 20,  46 => 12,  43 => 11,  40 => 14,  38 => 3,  34 => 6,  31 => 5,  28 => 4,);
    }
}
