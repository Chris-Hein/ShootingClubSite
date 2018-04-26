<?php

/* form-elements/textarea.twig */
class __TwigTemplate_260aae99e9368e0c7a641812606fdf77dd0989798b89e95944eede8ae41eacea extends Twig_Template
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
    }

    // line 1
    public function gettextarea($_id = null, $_name = "", $_value = "", $_attributes = array())
    {
        $context = $this->env->mergeGlobals(array(
            "id" => $_id,
            "name" => $_name,
            "value" => $_value,
            "attributes" => $_attributes,
        ));

        $blocks = array();

        ob_start();
        try {
            // line 2
            echo "\t";
            if (((isset($context["name"]) ? $context["name"] : null) == "")) {
                // line 3
                echo "\t\t";
                $context["id"] = (isset($context["name"]) ? $context["name"] : null);
                // line 4
                echo "\t";
            }
            // line 5
            echo "\t<textarea
\t\tname=\"";
            // line 6
            echo twig_escape_filter($this->env, (isset($context["name"]) ? $context["name"] : null), "html", null, true);
            echo "\"
\t\tid=\"";
            // line 7
            echo twig_escape_filter($this->env, (isset($context["id"]) ? $context["id"] : null), "html", null, true);
            echo "\"
\t\tclass=\"ai1ec-form-control ";
            // line 8
            echo twig_escape_filter($this->env, $this->getAttribute((isset($context["attributes"]) ? $context["attributes"] : null), "class"), "html", null, true);
            echo "\"
\t\t";
            // line 9
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["attributes"]) ? $context["attributes"] : null));
            foreach ($context['_seq'] as $context["attribute"] => $context["value"]) {
                // line 10
                echo "\t\t\t";
                if (((isset($context["attribute"]) ? $context["attribute"] : null) != "class")) {
                    // line 11
                    echo "\t\t\t\t";
                    echo twig_escape_filter($this->env, (isset($context["attribute"]) ? $context["attribute"] : null), "html", null, true);
                    echo "=\"";
                    echo twig_escape_filter($this->env, (isset($context["value"]) ? $context["value"] : null), "html", null, true);
                    echo "\"
\t\t\t";
                }
                // line 13
                echo "\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['attribute'], $context['value'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 14
            echo "\t\t>";
            echo twig_escape_filter($this->env, (isset($context["value"]) ? $context["value"] : null), "html", null, true);
            echo "</textarea>
";
        } catch (Exception $e) {
            ob_end_clean();

            throw $e;
        }

        return ('' === $tmp = ob_get_clean()) ? '' : new Twig_Markup($tmp, $this->env->getCharset());
    }

    public function getTemplateName()
    {
        return "form-elements/textarea.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  68 => 21,  62 => 18,  36 => 8,  123 => 33,  114 => 30,  96 => 27,  79 => 23,  57 => 15,  50 => 13,  27 => 4,  163 => 31,  152 => 29,  148 => 28,  144 => 27,  140 => 26,  136 => 25,  133 => 37,  127 => 34,  124 => 21,  109 => 20,  76 => 12,  45 => 4,  42 => 11,  91 => 25,  88 => 32,  81 => 27,  77 => 26,  73 => 22,  58 => 17,  29 => 7,  129 => 53,  119 => 32,  115 => 48,  108 => 44,  104 => 43,  97 => 17,  93 => 38,  86 => 34,  82 => 33,  75 => 29,  71 => 11,  67 => 19,  60 => 18,  48 => 5,  33 => 8,  22 => 2,  24 => 2,  168 => 36,  162 => 35,  156 => 33,  145 => 31,  141 => 30,  137 => 38,  134 => 28,  130 => 23,  121 => 24,  110 => 29,  106 => 21,  102 => 28,  99 => 19,  95 => 35,  90 => 17,  87 => 24,  83 => 14,  80 => 14,  74 => 13,  66 => 11,  63 => 10,  59 => 9,  55 => 8,  44 => 5,  21 => 1,  51 => 7,  49 => 9,  41 => 4,  35 => 2,  30 => 5,  26 => 2,  19 => 1,  47 => 6,  39 => 9,  37 => 9,  32 => 6,  23 => 3,  20 => 1,  56 => 21,  52 => 14,  46 => 12,  43 => 11,  40 => 14,  38 => 3,  34 => 6,  31 => 5,  28 => 4,);
    }
}
