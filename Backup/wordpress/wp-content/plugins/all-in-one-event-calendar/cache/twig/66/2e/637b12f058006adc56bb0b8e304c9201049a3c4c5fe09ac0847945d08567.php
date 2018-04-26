<?php

/* setting/api-signup.twig */
class __TwigTemplate_662e637b12f058006adc56bb0b8e304c9201049a3c4c5fe09ac0847945d08567 extends Twig_Template
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
        if ((isset($context["api_signed"]) ? $context["api_signed"] : null)) {
            // line 2
            echo "<div class=\"ai1ec-well\" id=\"ai1ec-api-signed-in\">
\t<i class=\"ai1ec-fa ai1ec-fa-check ai1ec-fa-fw\"></i>
\t";
            // line 4
            echo (isset($context["signed_in_text"]) ? $context["signed_in_text"] : null);
            echo "
\t";
            // line 5
            if ((isset($context["can_sign_out"]) ? $context["can_sign_out"] : null)) {
                // line 6
                echo "\t\t<a href=\"#\" id=\"ai1ec-api-signout\" class=\"ai1ec-pull-right\"
\t\t   data-action=\"";
                // line 7
                echo twig_escape_filter($this->env, (isset($context["api_action"]) ? $context["api_action"] : null), "html", null, true);
                echo "\">";
                echo twig_escape_filter($this->env, (isset($context["sign_out_text"]) ? $context["sign_out_text"] : null), "html", null, true);
                echo "</a>
\t";
            }
            // line 9
            echo "\t";
            echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->wp_nonce_field($this->getAttribute((isset($context["nonce"]) ? $context["nonce"] : null), "action"), $this->getAttribute((isset($context["nonce"]) ? $context["nonce"] : null), "name"), $this->getAttribute((isset($context["nonce"]) ? $context["nonce"] : null), "referrer")), "html", null, true);
            echo "
\t<div id=\"ai1ec-api-signout-confirm\">
\t\t";
            // line 11
            echo (isset($context["sign_out_warning"]) ? $context["sign_out_warning"] : null);
            echo "
\t\t<div class=\"ai1ec-api-signout-buttons\">
\t\t\t<a href=\"#\" class=\"ai1ec-btn ai1ec-btn-cancel ai1ec-btn-warning\"
\t\t\t   id=\"ai1ec-api-signout-cancel\">
\t\t\t\t\t";
            // line 15
            echo twig_escape_filter($this->env, (isset($context["sign_out_cancel"]) ? $context["sign_out_cancel"] : null), "html", null, true);
            echo "
\t\t\t</a>
\t\t\t<a href=\"#\" class=\"ai1ec-btn ai1ec-btn-danger\"
\t\t\t   id=\"ai1ec-api-signout-button\">
\t\t\t\t\t";
            // line 19
            echo twig_escape_filter($this->env, (isset($context["sign_out_confirm"]) ? $context["sign_out_confirm"] : null), "html", null, true);
            echo "
\t\t\t  </a>
\t\t</div>
\t</div>
</div>
";
        } elseif ((isset($context["signup_available"]) ? $context["signup_available"] : null)) {
            // line 25
            echo "<div class=\"timely-api ai1ec-well\">
\t";
            // line 26
            if ((!twig_test_empty((isset($context["title"]) ? $context["title"] : null)))) {
                // line 27
                echo "\t\t<span>";
                echo (isset($context["title"]) ? $context["title"] : null);
                echo "</span>
\t";
            }
            // line 29
            echo "\t<a href=\"#\" class=\"ai1ec-pull-right ai1ec-api-signup-hide ai1ec-hidden\">";
            echo twig_escape_filter($this->env, (isset($context["hide_form_text"]) ? $context["hide_form_text"] : null), "html", null, true);
            echo "</a>
\t<a href=\"#\" class=\"ai1ec-pull-right ai1ec-signup-show\">";
            // line 30
            echo twig_escape_filter($this->env, (isset($context["show_form_text"]) ? $context["show_form_text"] : null), "html", null, true);
            echo "</a>
\t<div id=\"ai1ec-api-signup-form\" class=\"ai1ec-hidden\" data-action=\"";
            // line 31
            echo twig_escape_filter($this->env, (isset($context["api_action"]) ? $context["api_action"] : null), "html", null, true);
            echo "\">
\t\t<!-- Trick to disable autocomplete -->
\t\t<input type=\"hidden\" name=\"ai1ec_email\" class=\"ai1ec-noauto\" />
\t\t<input type=\"hidden\" name=\"ai1ec_password\" class=\"ai1ec-noauto\" />
\t\t<!-- -->
\t\t";
            // line 36
            echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->wp_nonce_field($this->getAttribute((isset($context["nonce"]) ? $context["nonce"] : null), "action"), $this->getAttribute((isset($context["nonce"]) ? $context["nonce"] : null), "name"), $this->getAttribute((isset($context["nonce"]) ? $context["nonce"] : null), "referrer")), "html", null, true);
            echo "
\t\t<div class=\"metabox-holder\">
\t\t\t<div class=\"post-box-container left-side\">
\t\t\t\t<table class=\"ai1ec-ticketing-signup\">
\t\t\t\t\t<tr>
\t\t\t\t\t\t<td class=\"ai1ec_label_field\">
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td class=\"ai1ec_input_field\" style=\"padding-bottom:15px;\">
\t\t\t\t\t\t\t<label style=\"margin-right:10px\">
\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"ai1ec_signing\"
\t\t\t\t\t\t\t\t\t   value=\"1\" checked=\"checked\" />
\t\t\t\t\t\t\t\t";
            // line 47
            echo twig_escape_filter($this->env, (isset($context["register_text"]) ? $context["register_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</label>
\t\t\t\t\t\t\t<label>
\t\t\t\t\t\t\t\t<input type=\"radio\" name=\"ai1ec_signing\" value=\"2\"/>
\t\t\t\t\t\t\t\t";
            // line 51
            echo twig_escape_filter($this->env, (isset($context["sign_in_text"]) ? $context["sign_in_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</label>
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t";
            // line 57
            echo twig_escape_filter($this->env, (isset($context["full_name_text"]) ? $context["full_name_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<div class=\"ai1ec-ticket-field-error\">
\t\t\t\t\t\t\t\t";
            // line 61
            echo twig_escape_filter($this->env, (isset($context["required_text"]) ? $context["required_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t<input type=\"text\" name=\"ai1ec_name\" class=\"ai1ec-required\" />
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr class=\"signin\">
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t";
            // line 68
            echo twig_escape_filter($this->env, (isset($context["email_text"]) ? $context["email_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<div class=\"ai1ec-ticket-field-error\">
\t\t\t\t\t\t\t\t";
            // line 72
            echo twig_escape_filter($this->env, (isset($context["required_text"]) ? $context["required_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t<input type=\"text\" name=\"ai1ec_email\" class=\"ai1ec-required\" />
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr class=\"signin\">
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t";
            // line 79
            echo twig_escape_filter($this->env, (isset($context["password_text"]) ? $context["password_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<div class=\"ai1ec-ticket-field-error\">
\t\t\t\t\t\t\t\t";
            // line 83
            echo twig_escape_filter($this->env, (isset($context["required_text"]) ? $context["required_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t<input type=\"password\" name=\"ai1ec_password\" class=\"ai1ec-required\" />
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t";
            // line 90
            echo twig_escape_filter($this->env, (isset($context["confirm_password_text"]) ? $context["confirm_password_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<div class=\"ai1ec-ticket-field-error\">
\t\t\t\t\t\t\t\t";
            // line 94
            echo twig_escape_filter($this->env, (isset($context["required_text"]) ? $context["required_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t<input type=\"password\" name=\"ai1ec_password_confirmation\"
\t\t\t\t\t\t\t\t   class=\"ai1ec-required\" />
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t";
            // line 102
            echo twig_escape_filter($this->env, (isset($context["phone_number_text"]) ? $context["phone_number_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<div class=\"ai1ec-ticket-field-error\">
\t\t\t\t\t\t\t\t";
            // line 106
            echo twig_escape_filter($this->env, (isset($context["required_text"]) ? $context["required_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t<input type=\"text\" name=\"ai1ec_phone\" class=\"ai1ec-required\" />
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr class=\"signin\">
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t";
            // line 113
            echo twig_escape_filter($this->env, (isset($context["calendar_type_text"]) ? $context["calendar_type_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<div class=\"ai1ec-ticket-field-error\">
\t\t\t\t\t\t\t\t";
            // line 117
            echo twig_escape_filter($this->env, (isset($context["required_text"]) ? $context["required_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t<select name=\"ai1ec_calendar_type\" class=\"ai1ec-required\">
\t\t\t\t\t\t\t\t<option value=\"\"></option>
\t\t\t\t\t\t\t\t";
            // line 121
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["calendar_types"]) ? $context["calendar_types"] : null));
            foreach ($context['_seq'] as $context["calendar_type_key"] => $context["calendar_type_option"]) {
                // line 122
                echo "\t\t\t\t\t\t\t\t\t<option value=\"";
                echo twig_escape_filter($this->env, (isset($context["calendar_type_key"]) ? $context["calendar_type_key"] : null), "html", null, true);
                echo "\">
\t\t\t\t\t\t\t\t\t\t";
                // line 123
                echo twig_escape_filter($this->env, (isset($context["calendar_type_option"]) ? $context["calendar_type_option"] : null), "html", null, true);
                echo "
\t\t\t\t\t\t\t\t\t</option>
\t\t\t\t\t\t\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['calendar_type_key'], $context['calendar_type_option'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 126
            echo "\t\t\t\t\t\t\t</select>
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<div class=\"ai1ec-ticket-field-error\">
\t\t\t\t\t\t\t\t";
            // line 134
            echo twig_escape_filter($this->env, (isset($context["required_text"]) ? $context["required_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t<label for=\"ai1ec_terms\">
\t\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"ai1ec_terms\"
\t\t\t\t\t\t\t\t\t   name=\"ai1ec_terms\" class=\"ai1ec-required\" />
\t\t\t\t\t\t\t\t";
            // line 139
            echo (isset($context["terms_text"]) ? $context["terms_text"] : null);
            echo "
\t\t\t\t\t\t\t</label>
\t\t\t\t\t\t\t<a href=\"#\" name=\"ai1ec_tickets_signin\"  style=\"margin-top:20px;\"
\t\t\t\t\t\t\t   class=\"ai1ec-btn ai1ec-btn-lg ai1ec-btn-primary\">
\t\t\t\t\t\t\t\t";
            // line 143
            echo twig_escape_filter($this->env, (isset($context["sign_up_button_text"]) ? $context["sign_up_button_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</a>
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t\t<tr class=\"signin ai1ec-hidden\">
\t\t\t\t\t\t<td>
\t\t\t\t\t\t</td>
\t\t\t\t\t\t<td>
\t\t\t\t\t\t\t<a href=\"#\" name=\"ai1ec_tickets_signin\"  style=\"margin-top:20px;\"
\t\t\t\t\t\t\t   class=\"ai1ec-btn ai1ec-btn-lg ai1ec-btn-primary\">
\t\t\t\t\t\t\t\t";
            // line 153
            echo twig_escape_filter($this->env, (isset($context["sign_in_button_text"]) ? $context["sign_in_button_text"] : null), "html", null, true);
            echo "
\t\t\t\t\t\t\t</a>
\t\t\t\t\t\t</td>
\t\t\t\t\t</tr>
\t\t\t\t</table>
\t\t\t</div>
\t\t</div>
\t</div>
</div>
";
        }
    }

    public function getTemplateName()
    {
        return "setting/api-signup.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  284 => 153,  271 => 143,  264 => 139,  256 => 134,  246 => 126,  237 => 123,  232 => 122,  228 => 121,  221 => 117,  214 => 113,  204 => 106,  197 => 102,  186 => 94,  179 => 90,  169 => 83,  135 => 61,  128 => 57,  112 => 47,  98 => 36,  70 => 25,  61 => 19,  54 => 15,  25 => 4,  68 => 21,  62 => 18,  36 => 8,  123 => 33,  114 => 30,  96 => 27,  79 => 23,  57 => 15,  50 => 13,  27 => 4,  163 => 31,  152 => 72,  148 => 28,  144 => 27,  140 => 26,  136 => 25,  133 => 37,  127 => 34,  124 => 21,  109 => 20,  76 => 12,  45 => 4,  42 => 9,  91 => 25,  88 => 32,  81 => 29,  77 => 26,  73 => 26,  58 => 17,  29 => 5,  129 => 53,  119 => 51,  115 => 48,  108 => 44,  104 => 43,  97 => 17,  93 => 38,  86 => 30,  82 => 33,  75 => 27,  71 => 11,  67 => 19,  60 => 18,  48 => 5,  33 => 8,  22 => 2,  24 => 2,  168 => 36,  162 => 79,  156 => 33,  145 => 68,  141 => 30,  137 => 38,  134 => 28,  130 => 23,  121 => 24,  110 => 29,  106 => 21,  102 => 28,  99 => 19,  95 => 35,  90 => 31,  87 => 24,  83 => 14,  80 => 14,  74 => 13,  66 => 11,  63 => 10,  59 => 9,  55 => 8,  44 => 5,  21 => 2,  51 => 7,  49 => 9,  41 => 9,  35 => 7,  30 => 5,  26 => 2,  19 => 1,  47 => 11,  39 => 9,  37 => 9,  32 => 6,  23 => 3,  20 => 1,  56 => 21,  52 => 13,  46 => 12,  43 => 11,  40 => 14,  38 => 3,  34 => 7,  31 => 6,  28 => 4,);
    }
}
