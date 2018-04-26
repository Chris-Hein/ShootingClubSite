<?php

/* recurrence.twig */
class __TwigTemplate_dc78b950182efb8f436b144938fb0dc48cf395d7daabe20293234dbcf2b26545 extends Twig_Template
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
        if ((!twig_test_empty((isset($context["recurrence"]) ? $context["recurrence"] : null)))) {
            // line 2
            echo "\t<div class=\"ai1ec-recurrence ai1ec-btn-group\">
\t\t<button class=\"ai1ec-btn ai1ec-btn-default ai1ec-btn-xs
\t\t\tai1ec-tooltip-trigger ai1ec-disabled ai1ec-text-muted\"
\t\t\tdata-html=\"true\"
\t\t\ttitle=\"";
            // line 6
            ob_start();
            // line 7
            echo "\t\t\t\t";
            echo twig_escape_filter($this->env, strtr((isset($context["recurrence"]) ? $context["recurrence"] : null), array("; " => "
")), "html_attr");
            echo "
\t\t\t\t";
            // line 8
            if ((!twig_test_empty((isset($context["exclude"]) ? $context["exclude"] : null)))) {
                // line 9
                echo "\t\t\t\t\t";
                echo twig_escape_filter($this->env, ((("<div class=\"ai1ec-recurrence-exclude\">" . Ai1ec_I18n::__("Excludes: ")) . (isset($context["exclude"]) ? $context["exclude"] : null)) . "</div>"), "html_attr");
                echo "
\t\t\t\t";
            }
            // line 11
            echo "\t\t\t";
            echo trim(preg_replace('/>\s+</', '><', ob_get_clean()));
            echo "\">
\t\t\t<i class=\"ai1ec-fa ai1ec-fa-repeat\"></i>
\t\t\t";
            // line 13
            echo twig_escape_filter($this->env, Ai1ec_I18n::__("Repeats"), "html", null, true);
            echo "
\t\t</button>

\t\t";
            // line 16
            if ((!twig_test_empty((isset($context["edit_instance_url"]) ? $context["edit_instance_url"] : null)))) {
                // line 17
                echo "\t\t\t<a class=\"ai1ec-btn ai1ec-btn-default ai1ec-btn-xs ai1ec-tooltip-trigger
\t\t\t\tai1ec-text-muted\"
\t\t\t\ttitle=\"";
                // line 19
                echo twig_escape_filter($this->env, (isset($context["edit_instance_text"]) ? $context["edit_instance_text"] : null), "html_attr");
                echo "\"
\t\t\t\thref=\"";
                // line 20
                echo twig_escape_filter($this->env, (isset($context["edit_instance_url"]) ? $context["edit_instance_url"] : null), "html", null, true);
                echo "\">
\t\t\t\t<i class=\"ai1ec-fa ai1ec-fa-pencil\"></i>
\t\t\t</a>
\t\t";
            }
            // line 24
            echo "\t</div>
";
        }
    }

    public function getTemplateName()
    {
        return "recurrence.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  72 => 24,  65 => 20,  61 => 19,  57 => 17,  49 => 13,  43 => 11,  35 => 8,  27 => 6,  456 => 177,  451 => 174,  448 => 170,  445 => 169,  443 => 168,  440 => 167,  437 => 165,  435 => 164,  432 => 162,  430 => 161,  427 => 160,  424 => 159,  414 => 155,  410 => 154,  405 => 152,  401 => 151,  397 => 150,  394 => 149,  389 => 148,  387 => 147,  384 => 146,  380 => 144,  370 => 141,  366 => 140,  361 => 138,  357 => 137,  353 => 136,  350 => 135,  345 => 134,  343 => 133,  340 => 132,  333 => 128,  329 => 127,  324 => 125,  319 => 123,  316 => 122,  314 => 121,  311 => 120,  304 => 116,  300 => 115,  295 => 113,  290 => 111,  287 => 110,  285 => 109,  282 => 108,  274 => 105,  268 => 104,  265 => 103,  263 => 102,  260 => 101,  257 => 100,  252 => 97,  248 => 96,  243 => 94,  239 => 93,  236 => 92,  234 => 91,  231 => 90,  224 => 86,  220 => 85,  214 => 84,  211 => 83,  209 => 82,  206 => 81,  199 => 77,  195 => 76,  189 => 75,  186 => 74,  184 => 73,  178 => 70,  174 => 69,  171 => 68,  168 => 67,  165 => 66,  159 => 64,  153 => 62,  150 => 61,  148 => 60,  144 => 59,  140 => 58,  134 => 57,  130 => 55,  123 => 51,  119 => 49,  116 => 48,  113 => 47,  109 => 45,  106 => 44,  103 => 43,  101 => 42,  97 => 40,  91 => 38,  89 => 37,  85 => 35,  82 => 34,  79 => 28,  76 => 27,  69 => 23,  62 => 19,  55 => 16,  53 => 15,  46 => 11,  34 => 5,  30 => 4,  51 => 15,  41 => 11,  33 => 9,  26 => 3,  21 => 2,  47 => 14,  44 => 11,  37 => 9,  31 => 5,  29 => 7,  24 => 3,  22 => 2,  19 => 1,);
    }
}
