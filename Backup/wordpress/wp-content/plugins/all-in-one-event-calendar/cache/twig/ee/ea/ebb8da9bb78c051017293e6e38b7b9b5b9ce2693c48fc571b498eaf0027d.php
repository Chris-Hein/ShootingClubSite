<?php

/* setting/select.twig */
class __TwigTemplate_eeeaebb8da9bb78c051017293e6e38b7b9b5b9ce2693c48fc571b498eaf0027d extends Twig_Template
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
        echo "<label class=\"ai1ec-control-label ";
        if ((!(isset($context["stacked"]) ? $context["stacked"] : null))) {
            echo "ai1ec-col-sm-5";
        }
        echo "\"
  for=\"";
        // line 2
        echo twig_escape_filter($this->env, (isset($context["id"]) ? $context["id"] : null), "html", null, true);
        echo "\">
\t";
        // line 3
        echo (isset($context["label"]) ? $context["label"] : null);
        echo "
</label>
<div ";
        // line 5
        if ((!(isset($context["stacked"]) ? $context["stacked"] : null))) {
            echo "class=\"ai1ec-col-sm-7\"";
        }
        echo ">
  ";
        // line 6
        $context["__internal_fd9b135b410f871a6c82c9f7876e3b1abcb8d052d29fff858ff75e4b6f5122cc"] = $this->env->loadTemplate("form-elements/select.twig");
        // line 7
        echo "  ";
        echo $context["__internal_fd9b135b410f871a6c82c9f7876e3b1abcb8d052d29fff858ff75e4b6f5122cc"]->getselect((isset($context["id"]) ? $context["id"] : null), (isset($context["name"]) ? $context["name"] : null), (isset($context["attributes"]) ? $context["attributes"] : null), (isset($context["options"]) ? $context["options"] : null));
        echo "
</div>
";
        // line 9
        if ((!twig_test_empty((isset($context["fieldsets"]) ? $context["fieldsets"] : null)))) {
            // line 10
            echo "  ";
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["fieldsets"]) ? $context["fieldsets"] : null));
            foreach ($context['_seq'] as $context["_key"] => $context["fieldset"]) {
                // line 11
                echo "    ";
                echo (isset($context["fieldset"]) ? $context["fieldset"] : null);
                echo "
  ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['fieldset'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
        }
    }

    public function getTemplateName()
    {
        return "setting/select.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  51 => 10,  49 => 9,  41 => 6,  35 => 5,  30 => 3,  26 => 2,  19 => 1,  47 => 7,  39 => 8,  37 => 7,  32 => 5,  23 => 2,  20 => 1,  56 => 11,  52 => 11,  46 => 8,  43 => 7,  40 => 6,  38 => 5,  34 => 4,  31 => 3,  28 => 4,);
    }
}
