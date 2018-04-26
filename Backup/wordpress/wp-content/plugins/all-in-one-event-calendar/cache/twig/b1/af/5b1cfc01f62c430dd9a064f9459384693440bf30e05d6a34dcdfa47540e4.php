<?php

/* agenda-widget.twig */
class __TwigTemplate_b1af5b1cfc01f62c430dd9a064f9459384693440bf30e05d6a34dcdfa47540e4 extends Twig_Template
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
        echo "<style>
<!--
";
        // line 3
        echo (isset($context["css"]) ? $context["css"] : null);
        echo "
-->
</style>
<div class=\"timely ai1ec-agenda-widget-view ai1ec-clearfix\">

\t";
        // line 8
        if (twig_test_empty((isset($context["dates"]) ? $context["dates"] : null))) {
            // line 9
            echo "\t\t<p class=\"ai1ec-no-results\">
\t\t\t";
            // line 10
            echo twig_escape_filter($this->env, (isset($context["text_upcoming_events"]) ? $context["text_upcoming_events"] : null), "html", null, true);
            echo "
\t\t</p>
\t";
        } else {
            // line 13
            echo "\t\t<div>
\t\t\t";
            // line 14
            $context["tag_for_days"] = "a";
            // line 15
            echo "\t\t\t";
            if (((isset($context["link_for_days"]) ? $context["link_for_days"] : null) == false)) {
                // line 16
                echo "\t\t\t\t";
                $context["tag_for_days"] = "span";
                // line 17
                echo "\t\t\t";
            }
            // line 18
            echo "\t\t\t";
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["dates"]) ? $context["dates"] : null));
            $context['loop'] = array(
              'parent' => $context['_parent'],
              'index0' => 0,
              'index'  => 1,
              'first'  => true,
            );
            if (is_array($context['_seq']) || (is_object($context['_seq']) && $context['_seq'] instanceof Countable)) {
                $length = count($context['_seq']);
                $context['loop']['revindex0'] = $length - 1;
                $context['loop']['revindex'] = $length;
                $context['loop']['length'] = $length;
                $context['loop']['last'] = 1 === $length;
            }
            foreach ($context['_seq'] as $context["date"] => $context["date_info"]) {
                // line 19
                echo "\t\t\t\t<div class=\"ai1ec-date
\t\t\t\t\t";
                // line 20
                if ((!twig_test_empty($this->getAttribute((isset($context["date_info"]) ? $context["date_info"] : null), "today")))) {
                    echo "ai1ec-today";
                }
                echo "\">
\t\t\t\t\t<";
                // line 21
                echo twig_escape_filter($this->env, (isset($context["tag_for_days"]) ? $context["tag_for_days"] : null), "html", null, true);
                echo " class=\"ai1ec-date-title ai1ec-load-view\"
\t\t\t\t\t\thref=\"";
                // line 22
                echo twig_escape_filter($this->env, $this->getAttribute((isset($context["date_info"]) ? $context["date_info"] : null), "href"), "html_attr");
                echo "\">
\t\t\t\t\t\t<div class=\"ai1ec-month\">";
                // line 23
                echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->month((isset($context["date"]) ? $context["date"] : null)), "html", null, true);
                echo "</div>
\t\t\t\t\t\t<div class=\"ai1ec-day\">";
                // line 24
                echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->day((isset($context["date"]) ? $context["date"] : null)), "html", null, true);
                echo "</div>
\t\t\t\t\t\t<div class=\"ai1ec-weekday\">";
                // line 25
                echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->weekday((isset($context["date"]) ? $context["date"] : null)), "html", null, true);
                echo "</div>
\t\t\t\t\t\t";
                // line 26
                if ((isset($context["show_year_in_agenda_dates"]) ? $context["show_year_in_agenda_dates"] : null)) {
                    // line 27
                    echo "\t\t\t\t\t\t\t<div class=\"ai1ec-year\">";
                    echo twig_escape_filter($this->env, $this->env->getExtension('ai1ec')->year((isset($context["date"]) ? $context["date"] : null)), "html", null, true);
                    echo "</div>
\t\t\t\t\t\t";
                }
                // line 29
                echo "\t\t\t\t\t</";
                echo twig_escape_filter($this->env, (isset($context["tag_for_days"]) ? $context["tag_for_days"] : null), "html", null, true);
                echo ">
\t\t\t\t\t<div class=\"ai1ec-date-events\">
\t\t\t\t\t\t";
                // line 31
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["date_info"]) ? $context["date_info"] : null), "events"));
                $context['loop'] = array(
                  'parent' => $context['_parent'],
                  'index0' => 0,
                  'index'  => 1,
                  'first'  => true,
                );
                if (is_array($context['_seq']) || (is_object($context['_seq']) && $context['_seq'] instanceof Countable)) {
                    $length = count($context['_seq']);
                    $context['loop']['revindex0'] = $length - 1;
                    $context['loop']['revindex'] = $length;
                    $context['loop']['length'] = $length;
                    $context['loop']['last'] = 1 === $length;
                }
                foreach ($context['_seq'] as $context["_key"] => $context["category"]) {
                    // line 32
                    echo "\t\t\t\t\t\t\t";
                    $context['_parent'] = (array) $context;
                    $context['_seq'] = twig_ensure_traversable((isset($context["category"]) ? $context["category"] : null));
                    $context['loop'] = array(
                      'parent' => $context['_parent'],
                      'index0' => 0,
                      'index'  => 1,
                      'first'  => true,
                    );
                    if (is_array($context['_seq']) || (is_object($context['_seq']) && $context['_seq'] instanceof Countable)) {
                        $length = count($context['_seq']);
                        $context['loop']['revindex0'] = $length - 1;
                        $context['loop']['revindex'] = $length;
                        $context['loop']['length'] = $length;
                        $context['loop']['last'] = 1 === $length;
                    }
                    foreach ($context['_seq'] as $context["_key"] => $context["event"]) {
                        // line 33
                        echo "\t\t\t\t\t\t\t\t<div class=\"ai1ec-event
\t\t\t\t\t\t\t\t\tai1ec-event-id-";
                        // line 34
                        echo twig_escape_filter($this->env, $this->getAttribute((isset($context["event"]) ? $context["event"] : null), "post_id"), "html", null, true);
                        echo "
\t\t\t\t\t\t\t\t\tai1ec-event-instance-id-";
                        // line 35
                        echo twig_escape_filter($this->env, $this->getAttribute((isset($context["event"]) ? $context["event"] : null), "instance_id"), "html", null, true);
                        echo "
\t\t\t\t\t\t\t\t\t";
                        // line 36
                        if ($this->getAttribute((isset($context["event"]) ? $context["event"] : null), "is_allday")) {
                            echo "ai1ec-allday";
                        }
                        echo "\">

\t\t\t\t\t\t\t\t\t<a href=\"";
                        // line 38
                        echo twig_escape_filter($this->env, $this->getAttribute((isset($context["event"]) ? $context["event"] : null), "permalink"), "html_attr");
                        echo "\"
\t\t\t\t\t\t\t\t\t\tclass=\"ai1ec-popup-trigger ai1ec-load-event\">
\t\t\t\t\t\t\t\t\t\t";
                        // line 40
                        if ($this->getAttribute((isset($context["event"]) ? $context["event"] : null), "is_allday")) {
                            // line 41
                            echo "\t\t\t\t\t\t\t\t\t\t\t<span class=\"ai1ec-allday-badge\">
\t\t\t\t\t\t\t\t\t\t\t\t";
                            // line 42
                            echo twig_escape_filter($this->env, (isset($context["text_all_day"]) ? $context["text_all_day"] : null), "html", null, true);
                            echo "
\t\t\t\t\t\t\t\t\t\t\t</span>
\t\t\t\t\t\t\t\t\t\t";
                        } else {
                            // line 45
                            echo "\t\t\t\t\t\t\t\t\t\t\t<span class=\"ai1ec-event-time\">
\t\t\t\t\t\t\t\t\t\t\t\t";
                            // line 46
                            echo twig_escape_filter($this->env, $this->getAttribute((isset($context["event"]) ? $context["event"] : null), "short_start_time"), "html", null, true);
                            echo "
\t\t\t\t\t\t\t\t\t\t\t</span>
\t\t\t\t\t\t\t\t\t\t";
                        }
                        // line 49
                        echo "
\t\t\t\t\t\t\t\t\t\t<span class=\"ai1ec-event-title\">
\t\t\t\t\t\t\t\t\t\t\t";
                        // line 51
                        echo $this->env->getExtension('ai1ec')->truncate($this->getAttribute((isset($context["event"]) ? $context["event"] : null), "filtered_title"));
                        echo "
\t\t\t\t\t\t\t\t\t\t\t";
                        // line 52
                        if (((isset($context["show_location_in_title"]) ? $context["show_location_in_title"] : null) && (!twig_test_empty($this->getAttribute((isset($context["event"]) ? $context["event"] : null), "venue"))))) {
                            // line 53
                            echo "\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"ai1ec-event-location\"
\t\t\t\t\t\t\t\t\t\t\t\t\t>";
                            // line 54
                            echo twig_escape_filter($this->env, sprintf((isset($context["text_venue_separator"]) ? $context["text_venue_separator"] : null), $this->getAttribute((isset($context["event"]) ? $context["event"] : null), "venue")), "html", null, true);
                            echo "</span>
\t\t\t\t\t\t\t\t\t\t\t";
                        }
                        // line 56
                        echo "\t\t\t\t\t\t\t\t\t\t</span>
\t\t\t\t\t\t\t\t\t</a>

\t\t\t\t\t\t\t\t\t";
                        // line 59
                        $this->env->loadTemplate("event-popup.twig")->display(array_merge($context, array("text_venue_separator" => (isset($context["text_venue_separator"]) ? $context["text_venue_separator"] : null))));
                        // line 62
                        echo "
\t\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t";
                        ++$context['loop']['index0'];
                        ++$context['loop']['index'];
                        $context['loop']['first'] = false;
                        if (isset($context['loop']['length'])) {
                            --$context['loop']['revindex0'];
                            --$context['loop']['revindex'];
                            $context['loop']['last'] = 0 === $context['loop']['revindex0'];
                        }
                    }
                    $_parent = $context['_parent'];
                    unset($context['_seq'], $context['_iterated'], $context['_key'], $context['event'], $context['_parent'], $context['loop']);
                    $context = array_intersect_key($context, $_parent) + $_parent;
                    // line 64
                    echo " ";
                    // line 65
                    echo "\t\t\t\t\t\t";
                    ++$context['loop']['index0'];
                    ++$context['loop']['index'];
                    $context['loop']['first'] = false;
                    if (isset($context['loop']['length'])) {
                        --$context['loop']['revindex0'];
                        --$context['loop']['revindex'];
                        $context['loop']['last'] = 0 === $context['loop']['revindex0'];
                    }
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['category'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                echo " ";
                // line 66
                echo "\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t";
                ++$context['loop']['index0'];
                ++$context['loop']['index'];
                $context['loop']['first'] = false;
                if (isset($context['loop']['length'])) {
                    --$context['loop']['revindex0'];
                    --$context['loop']['revindex'];
                    $context['loop']['last'] = 0 === $context['loop']['revindex0'];
                }
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['date'], $context['date_info'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 68
            echo " ";
            // line 69
            echo "\t\t</div>
\t";
        }
        // line 70
        echo " ";
        // line 71
        echo "
\t";
        // line 72
        if (((isset($context["show_calendar_button"]) ? $context["show_calendar_button"] : null) || (isset($context["show_subscribe_buttons"]) ? $context["show_subscribe_buttons"] : null))) {
            // line 73
            echo "\t\t<div class=\"ai1ec-subscribe-buttons-widget\">
\t\t\t";
            // line 74
            if ((isset($context["show_calendar_button"]) ? $context["show_calendar_button"] : null)) {
                // line 75
                echo "\t\t\t\t<a class=\"ai1ec-btn ai1ec-btn-default ai1ec-btn-xs ai1ec-pull-right
\t\t\t\t\tai1ec-calendar-link\"
\t\t\t\t\thref=\"";
                // line 77
                echo twig_escape_filter($this->env, (isset($context["calendar_url"]) ? $context["calendar_url"] : null), "html_attr");
                echo "\">
\t\t\t\t\t";
                // line 78
                echo twig_escape_filter($this->env, (isset($context["text_view_calendar"]) ? $context["text_view_calendar"] : null), "html", null, true);
                echo "
\t\t\t\t\t<i class=\"ai1ec-fa ai1ec-fa-arrow-right\"></i>
\t\t\t\t</a>
\t\t\t";
            }
            // line 82
            echo "
\t\t\t";
            // line 83
            if (((isset($context["show_subscribe_buttons"]) ? $context["show_subscribe_buttons"] : null) == 1)) {
                // line 84
                echo "\t\t\t\t";
                $this->env->loadTemplate("subscribe-buttons.twig")->display(array_merge($context, array("button_classes" => "ai1ec-btn-xs", "export_url" => (isset($context["subscribe_url"]) ? $context["subscribe_url"] : null), "export_url_no_html" => (isset($context["subscribe_url_no_html"]) ? $context["subscribe_url_no_html"] : null), "subscribe_label" => (isset($context["text_subscribe_label"]) ? $context["text_subscribe_label"] : null), "text" => (isset($context["subscribe_buttons_text"]) ? $context["subscribe_buttons_text"] : null), "alignment" => "right")));
                // line 92
                echo "\t\t\t";
            }
            // line 93
            echo "\t\t</div>
\t";
        }
        // line 94
        echo " ";
        // line 95
        echo "
</div>

";
    }

    public function getTemplateName()
    {
        return "agenda-widget.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  319 => 95,  317 => 94,  313 => 93,  310 => 92,  307 => 84,  305 => 83,  302 => 82,  295 => 78,  291 => 77,  287 => 75,  285 => 74,  282 => 73,  280 => 72,  277 => 71,  275 => 70,  271 => 69,  269 => 68,  253 => 66,  238 => 65,  236 => 64,  220 => 62,  218 => 59,  213 => 56,  208 => 54,  205 => 53,  203 => 52,  199 => 51,  195 => 49,  189 => 46,  186 => 45,  180 => 42,  177 => 41,  175 => 40,  170 => 38,  163 => 36,  159 => 35,  155 => 34,  152 => 33,  134 => 32,  117 => 31,  111 => 29,  105 => 27,  103 => 26,  99 => 25,  95 => 24,  91 => 23,  87 => 22,  83 => 21,  77 => 20,  74 => 19,  56 => 18,  53 => 17,  50 => 16,  47 => 15,  45 => 14,  42 => 13,  36 => 10,  33 => 9,  31 => 8,  23 => 3,  19 => 1,);
    }
}
