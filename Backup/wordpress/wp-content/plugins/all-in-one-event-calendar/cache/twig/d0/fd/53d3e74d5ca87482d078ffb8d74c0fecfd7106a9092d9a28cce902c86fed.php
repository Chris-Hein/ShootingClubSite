<?php

/* event-single.twig */
class __TwigTemplate_d0fd53d3e74d5ca87482d078ffb8d74c0fecfd7106a9092d9a28cce902c86fed extends Twig_Template
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
        echo "<div class=\"timely ai1ec-single-event
\tai1ec-event-id-";
        // line 2
        echo twig_escape_filter($this->env, (isset($context["post_id"]) ? $context["post_id"] : null), "html", null, true);
        echo "
\tai1ec-event-instance-id-";
        // line 3
        echo twig_escape_filter($this->env, (isset($context["instance_id"]) ? $context["instance_id"] : null), "html", null, true);
        echo "
\t";
        // line 4
        if ($this->getAttribute((isset($context["event"]) ? $context["event"] : null), "is_multiday")) {
            echo "ai1ec-multiday";
        }
        // line 5
        echo "\t";
        if ($this->getAttribute((isset($context["event"]) ? $context["event"] : null), "is_allday")) {
            echo "ai1ec-allday";
        }
        echo "\">

<a id=\"ai1ec-event\"></a>

<div class=\"ai1ec-actions\">
\t<div class=\"ai1ec-btn-group-vertical ai1ec-clearfix\">
\t\t";
        // line 11
        echo (isset($context["back_to_calendar"]) ? $context["back_to_calendar"] : null);
        echo "
\t</div>

\t<div class=\"ai1ec-btn-group-vertical ai1ec-clearfix\">
\t\t";
        // line 15
        if ((!twig_test_empty((isset($context["ticket_url"]) ? $context["ticket_url"] : null)))) {
            // line 16
            echo "\t\t\t<a href=\"";
            echo twig_escape_filter($this->env, (isset($context["ticket_url"]) ? $context["ticket_url"] : null), "html_attr");
            echo "\" target=\"_blank\"
\t\t\t\tclass=\"ai1ec-tickets ai1ec-btn ai1ec-btn-sm ai1ec-btn-primary
\t\t\t\t\tai1ec-tooltip-trigger\"
\t\t\t\t\ttitle=\"";
            // line 19
            echo twig_escape_filter($this->env, (isset($context["tickets_url_label"]) ? $context["tickets_url_label"] : null), "html_attr");
            echo "\"
\t\t\t\t\tdata-placement=\"left\">
\t\t\t\t<i class=\"ai1ec-fa ai1ec-fa-ticket ai1ec-fa-fw\"></i>
\t\t\t\t<span class=\"ai1ec-hidden-xs\">
\t\t\t\t\t";
            // line 23
            echo twig_escape_filter($this->env, (isset($context["tickets_url_label"]) ? $context["tickets_url_label"] : null), "html", null, true);
            echo "
\t\t\t\t</span>
\t\t\t</a>
\t\t";
        }
        // line 27
        echo "\t\t";
        if ((isset($context["show_subscribe_buttons"]) ? $context["show_subscribe_buttons"] : null)) {
            // line 28
            echo "\t\t\t";
            $this->env->loadTemplate("subscribe-buttons.twig")->display(array_merge($context, array("export_url" => (isset($context["subscribe_url"]) ? $context["subscribe_url"] : null), "export_url_no_html" => (isset($context["subscribe_url_no_html"]) ? $context["subscribe_url_no_html"] : null), "subscribe_label" => (isset($context["text_add_calendar"]) ? $context["text_add_calendar"] : null), "text" => (isset($context["subscribe_buttons_text"]) ? $context["subscribe_buttons_text"] : null))));
            // line 34
            echo "\t\t";
        }
        // line 35
        echo "\t</div>

\t";
        // line 37
        if ((isset($context["extra_buttons"]) ? $context["extra_buttons"] : null)) {
            // line 38
            echo "\t\t";
            echo (isset($context["extra_buttons"]) ? $context["extra_buttons"] : null);
            echo "
\t";
        }
        // line 40
        echo "</div>

";
        // line 42
        if (twig_test_empty((isset($context["map"]) ? $context["map"] : null))) {
            // line 43
            echo "\t";
            $context["col1"] = "ai1ec-col-sm-3";
            // line 44
            echo "\t";
            $context["col2"] = "ai1ec-col-sm-9";
            // line 45
            echo "\t<div class=\"ai1ec-event-details ai1ec-clearfix\">
";
        } else {
            // line 47
            echo "\t";
            $context["col1"] = "ai1ec-col-sm-4 ai1ec-col-md-5";
            // line 48
            echo "\t";
            $context["col2"] = "ai1ec-col-sm-8 ai1ec-col-md-7";
            // line 49
            echo "\t<div class=\"ai1ec-event-details ai1ec-row\">
\t\t<div class=\"ai1ec-map ai1ec-col-sm-5 ai1ec-col-sm-push-7\">
\t\t\t";
            // line 51
            echo (isset($context["map"]) ? $context["map"] : null);
            echo "
\t\t</div>
\t\t<div class=\"ai1ec-col-sm-7 ai1ec-col-sm-pull-5\">
";
        }
        // line 55
        echo "
\t<div class=\"ai1ec-time ai1ec-row\">
\t\t<div class=\"ai1ec-field-label ";
        // line 57
        echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
        echo "\">";
        echo twig_escape_filter($this->env, (isset($context["text_when"]) ? $context["text_when"] : null), "html", null, true);
        echo "</div>
\t\t<div class=\"ai1ec-field-value ";
        // line 58
        echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
        echo " dt-duration\">
\t\t\t";
        // line 59
        echo $this->env->getExtension('ai1ec')->timespan((isset($context["event"]) ? $context["event"] : null));
        echo "
\t\t\t";
        // line 60
        if ($this->getAttribute((isset($context["timezone_info"]) ? $context["timezone_info"] : null), "show_timezone")) {
            // line 61
            echo "\t\t\t\t";
            if ($this->getAttribute((isset($context["timezone_info"]) ? $context["timezone_info"] : null), "using_calendar_tz")) {
                // line 62
                echo "\t\t\t\t\t<span>";
                echo twig_escape_filter($this->env, $this->getAttribute((isset($context["timezone_info"]) ? $context["timezone_info"] : null), "calendar_timezone"), "html", null, true);
                echo "</span>
\t\t\t\t";
            } else {
                // line 64
                echo "\t\t\t\t\t<span>";
                echo twig_escape_filter($this->env, $this->getAttribute((isset($context["timezone_info"]) ? $context["timezone_info"] : null), "event_timezone"), "html", null, true);
                echo "</span>
\t\t\t\t";
            }
            // line 66
            echo "\t\t\t";
        }
        // line 67
        echo "\t\t\t";
        $this->env->loadTemplate("recurrence.twig")->display($context);
        // line 68
        echo "\t\t</div>
\t\t<div class=\"ai1ec-hidden dt-start\">";
        // line 69
        echo twig_escape_filter($this->env, (isset($context["start"]) ? $context["start"] : null), "html", null, true);
        echo "</div>
\t\t<div class=\"ai1ec-hidden dt-end\">";
        // line 70
        echo twig_escape_filter($this->env, (isset($context["end"]) ? $context["end"] : null), "html", null, true);
        echo "</div>
\t</div>

\t";
        // line 73
        if ((!twig_test_empty((isset($context["location"]) ? $context["location"] : null)))) {
            // line 74
            echo "\t\t<div class=\"ai1ec-location ai1ec-row\">
\t\t\t<div class=\"ai1ec-field-label ";
            // line 75
            echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
            echo "\">";
            echo twig_escape_filter($this->env, (isset($context["text_where"]) ? $context["text_where"] : null), "html", null, true);
            echo "</div>
\t\t\t<div class=\"ai1ec-field-value ";
            // line 76
            echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
            echo " p-location\">
\t\t\t\t";
            // line 77
            echo (isset($context["location"]) ? $context["location"] : null);
            echo "
\t\t\t</div>
\t\t</div>
\t";
        }
        // line 81
        echo "
\t";
        // line 82
        if ((((!twig_test_empty((isset($context["cost"]) ? $context["cost"] : null))) || $this->getAttribute((isset($context["event"]) ? $context["event"] : null), "is_free")) && twig_test_empty((isset($context["tickets_block"]) ? $context["tickets_block"] : null)))) {
            // line 83
            echo "\t\t<div class=\"ai1ec-cost ai1ec-row\">
\t\t\t<div class=\"ai1ec-field-label ";
            // line 84
            echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
            echo "\">";
            echo twig_escape_filter($this->env, (isset($context["text_cost"]) ? $context["text_cost"] : null), "html", null, true);
            echo "</div>
\t\t\t<div class=\"ai1ec-field-value ";
            // line 85
            echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
            echo "\">
\t\t\t\t";
            // line 86
            echo twig_escape_filter($this->env, (($this->getAttribute((isset($context["event"]) ? $context["event"] : null), "is_free")) ? ((isset($context["text_free"]) ? $context["text_free"] : null)) : ((isset($context["cost"]) ? $context["cost"] : null))), "html", null, true);
            echo "
\t\t\t</div>
\t\t</div>
\t";
        }
        // line 90
        echo "
\t";
        // line 91
        if ((!twig_test_empty((isset($context["tickets_block"]) ? $context["tickets_block"] : null)))) {
            // line 92
            echo "\t\t<div class=\"ai1ec-cost ai1ec-row\">
\t\t\t<div class=\"ai1ec-field-label ";
            // line 93
            echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
            echo "\">
\t\t\t\t";
            // line 94
            echo twig_escape_filter($this->env, (isset($context["text_tickets"]) ? $context["text_tickets"] : null), "html", null, true);
            echo "
\t\t\t</div>
\t\t\t<div class=\"ai1ec-field-value ";
            // line 96
            echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
            echo "\">
\t\t\t\t";
            // line 97
            echo (isset($context["tickets_block"]) ? $context["tickets_block"] : null);
            echo "
\t\t\t</div>
\t\t</div>";
            // line 100
            echo "\t";
        }
        // line 101
        echo "
\t";
        // line 102
        if ((!twig_test_empty((isset($context["contact"]) ? $context["contact"] : null)))) {
            // line 103
            echo "\t\t<div class=\"ai1ec-contact ai1ec-row\">
\t\t\t<div class=\"ai1ec-field-label ";
            // line 104
            echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
            echo "\">";
            echo twig_escape_filter($this->env, (isset($context["text_contact"]) ? $context["text_contact"] : null), "html", null, true);
            echo "</div>
\t\t\t<div class=\"ai1ec-field-value ";
            // line 105
            echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
            echo "\">";
            echo (isset($context["contact"]) ? $context["contact"] : null);
            echo "</div>
\t\t</div>
\t";
        }
        // line 108
        echo "
\t";
        // line 109
        if ((!twig_test_empty((isset($context["categories"]) ? $context["categories"] : null)))) {
            // line 110
            echo "\t\t<div class=\"ai1ec-categories ai1ec-row\">
\t\t\t<div class=\"ai1ec-field-label ";
            // line 111
            echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
            echo " ai1ec-col-xs-1\">
\t\t\t\t<i class=\"ai1ec-fa ai1ec-fa-folder-open ai1ec-tooltip-trigger\"
\t\t\t\t\ttitle=\"";
            // line 113
            echo twig_escape_filter($this->env, (isset($context["text_categories"]) ? $context["text_categories"] : null), "html_attr");
            echo "\"></i>
\t\t\t</div>
\t\t\t<div class=\"ai1ec-field-value ";
            // line 115
            echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
            echo " ai1ec-col-xs-10\">
\t\t\t\t";
            // line 116
            echo (isset($context["categories"]) ? $context["categories"] : null);
            echo "
\t\t\t</div>
\t\t</div>
\t";
        }
        // line 120
        echo "
\t";
        // line 121
        if ((!twig_test_empty((isset($context["tags"]) ? $context["tags"] : null)))) {
            // line 122
            echo "\t\t<div class=\"ai1ec-tags ai1ec-row\">
\t\t\t<div class=\"ai1ec-field-label ";
            // line 123
            echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
            echo " ai1ec-col-xs-1\">
\t\t\t\t<i class=\"ai1ec-fa ai1ec-fa-tags ai1ec-tooltip-trigger\"
\t\t\t\t\ttitle=\"";
            // line 125
            echo twig_escape_filter($this->env, (isset($context["text_tags"]) ? $context["text_tags"] : null), "html_attr");
            echo "\"></i>
\t\t\t</div>
\t\t\t<div class=\"ai1ec-field-value ";
            // line 127
            echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
            echo " ai1ec-col-xs-10\">
\t\t\t\t";
            // line 128
            echo (isset($context["tags"]) ? $context["tags"] : null);
            echo "
\t\t\t</div>
\t\t</div>
\t";
        }
        // line 132
        echo "\t
\t";
        // line 133
        if ((!twig_test_empty((isset($context["filter_groups"]) ? $context["filter_groups"] : null)))) {
            // line 134
            echo "\t\t";
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["filter_groups"]) ? $context["filter_groups"] : null));
            foreach ($context['_seq'] as $context["_key"] => $context["filter_group"]) {
                // line 135
                echo "\t\t\t<div class=\"ai1ec-categories ai1ec-row\">
\t\t\t\t<div class=\"ai1ec-field-label ";
                // line 136
                echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
                echo " ai1ec-col-xs-1\">
\t\t\t\t\t<i class=\"ai1ec-fa ";
                // line 137
                echo twig_escape_filter($this->env, $this->getAttribute((isset($context["filter_group"]) ? $context["filter_group"] : null), "icon_name"), "html", null, true);
                echo " ai1ec-tooltip-trigger\"
\t\t\t\t\t\ttitle=\"";
                // line 138
                echo twig_escape_filter($this->env, $this->getAttribute((isset($context["filter_group"]) ? $context["filter_group"] : null), "text"), "html_attr");
                echo "\"></i>
\t\t\t\t</div>\t\t
\t\t\t\t<div class=\"ai1ec-field-value ";
                // line 140
                echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
                echo " ai1ec-col-xs-10\">
\t\t\t\t\t";
                // line 141
                echo $this->getAttribute((isset($context["filter_group"]) ? $context["filter_group"] : null), "html_value");
                echo "
\t\t\t\t</div>
\t\t\t</div>
\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['filter_group'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 144
            echo "\t
\t";
        }
        // line 146
        echo "
\t";
        // line 147
        if ((!twig_test_empty((isset($context["filter_groups"]) ? $context["filter_groups"] : null)))) {
            // line 148
            echo "\t\t";
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["filter_groups"]) ? $context["filter_groups"] : null));
            foreach ($context['_seq'] as $context["_key"] => $context["filter_group"]) {
                // line 149
                echo "\t\t\t<div class=\"ai1ec-categories ai1ec-row\">
\t\t\t\t<div class=\"ai1ec-field-label ";
                // line 150
                echo twig_escape_filter($this->env, (isset($context["col1"]) ? $context["col1"] : null), "html", null, true);
                echo " ai1ec-col-xs-1\">
\t\t\t\t\t<i class=\"ai1ec-fa ";
                // line 151
                echo twig_escape_filter($this->env, $this->getAttribute((isset($context["filter_group"]) ? $context["filter_group"] : null), "icon_name"), "html", null, true);
                echo " ai1ec-tooltip-trigger\"
\t\t\t\t\t\ttitle=\"";
                // line 152
                echo twig_escape_filter($this->env, $this->getAttribute((isset($context["filter_group"]) ? $context["filter_group"] : null), "text"), "html_attr");
                echo "\"></i>
\t\t\t\t</div>
\t\t\t\t<div class=\"ai1ec-field-value ";
                // line 154
                echo twig_escape_filter($this->env, (isset($context["col2"]) ? $context["col2"] : null), "html", null, true);
                echo " ai1ec-col-xs-10\">
\t\t\t\t\t";
                // line 155
                echo $this->getAttribute((isset($context["filter_group"]) ? $context["filter_group"] : null), "html_value");
                echo "
\t\t\t\t</div>
\t\t\t</div>
\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['filter_group'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 159
            echo "\t";
        }
        // line 160
        echo "
";
        // line 161
        if (twig_test_empty((isset($context["map"]) ? $context["map"] : null))) {
            // line 162
            echo "\t</div>";
        } else {
            // line 164
            echo "\t\t</div>";
            // line 165
            echo "\t</div>";
        }
        // line 167
        echo "
";
        // line 168
        if ((!(isset($context["hide_featured_image"]) ? $context["hide_featured_image"] : null))) {
            // line 169
            echo "\t";
            if (twig_test_empty((isset($context["content_img_url"]) ? $context["content_img_url"] : null))) {
                // line 170
                echo "\t\t";
                echo $this->env->getExtension('ai1ec')->avatar((isset($context["event"]) ? $context["event"] : null), array(0 => "post_thumbnail", 1 => "location_avatar", 2 => "category_avatar"), "timely alignleft", false);
                // line 174
                echo "
\t";
            }
        }
        // line 177
        echo "
</div>
";
    }

    public function getTemplateName()
    {
        return "event-single.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  456 => 177,  451 => 174,  448 => 170,  445 => 169,  443 => 168,  440 => 167,  437 => 165,  435 => 164,  432 => 162,  430 => 161,  427 => 160,  424 => 159,  414 => 155,  410 => 154,  405 => 152,  401 => 151,  397 => 150,  394 => 149,  389 => 148,  387 => 147,  384 => 146,  380 => 144,  370 => 141,  366 => 140,  361 => 138,  357 => 137,  353 => 136,  350 => 135,  345 => 134,  343 => 133,  340 => 132,  333 => 128,  329 => 127,  324 => 125,  319 => 123,  316 => 122,  314 => 121,  311 => 120,  304 => 116,  300 => 115,  295 => 113,  290 => 111,  287 => 110,  285 => 109,  282 => 108,  274 => 105,  268 => 104,  265 => 103,  263 => 102,  260 => 101,  257 => 100,  252 => 97,  248 => 96,  243 => 94,  239 => 93,  236 => 92,  234 => 91,  231 => 90,  224 => 86,  220 => 85,  214 => 84,  211 => 83,  209 => 82,  206 => 81,  199 => 77,  195 => 76,  189 => 75,  186 => 74,  184 => 73,  178 => 70,  174 => 69,  171 => 68,  168 => 67,  165 => 66,  159 => 64,  153 => 62,  150 => 61,  148 => 60,  144 => 59,  140 => 58,  134 => 57,  130 => 55,  123 => 51,  119 => 49,  116 => 48,  113 => 47,  109 => 45,  106 => 44,  103 => 43,  101 => 42,  97 => 40,  91 => 38,  89 => 37,  85 => 35,  82 => 34,  79 => 28,  76 => 27,  69 => 23,  62 => 19,  55 => 16,  53 => 15,  46 => 11,  34 => 5,  30 => 4,  51 => 15,  41 => 11,  33 => 9,  26 => 3,  21 => 2,  47 => 14,  44 => 11,  37 => 7,  31 => 5,  29 => 4,  24 => 3,  22 => 2,  19 => 1,);
    }
}
