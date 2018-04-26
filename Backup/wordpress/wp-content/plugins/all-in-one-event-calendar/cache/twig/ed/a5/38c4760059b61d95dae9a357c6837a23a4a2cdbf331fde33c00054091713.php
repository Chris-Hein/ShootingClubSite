<?php

/* ticketing/signup.twig */
class __TwigTemplate_eda538c4760059b61d95dae9a357c6837a23a4a2cdbf331fde33c00054091713 extends Twig_Template
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
        echo "<div class=\"wrap timely ticketing\" style=\"max-width: 550px;\">
\t<h2>";
        // line 2
        echo (isset($context["title"]) ? $context["title"] : null);
        echo "</h2><br>
\t<div id=\"poststuff\" style=\"min-width:550px;\">
\t\t";
        // line 4
        echo (isset($context["signup_form"]) ? $context["signup_form"] : null);
        echo "
\t</div>";
        // line 6
        echo "\t
\t";
        // line 7
        if ((array_key_exists("show_info", $context) && (isset($context["show_info"]) ? $context["show_info"] : null))) {
            // line 8
            echo "\t<div class=\"ai1ec-ticketing-info timely-saas\">
\t\t<br><br>
\t\tTimely Ticketing saves you both time and money.<br><br>
Save time by setting up your ticketing/registration when you're creating and editing your event all through your calendar dashboard. No need to manage your event and ticketing/registration in two different systems.<br><br>
Save money by only paying for your annual subscription and PayPal transaction costs. Unlike other ticketing platforms, Timely does not take any commissions. Events that are free have no additional costs other than your annual subscription. Create as many ticketing/registration events as you like.<br><br>
People can use credit cards or their PayPal account to purchase tickets.<br><br>

Timely Ticketing is not enabled for this website. Please sign up for Ticketing <a href=\"https://time.ly/tickets-existing-users/\" target=\"_blank\">here.</a>
\t\t<br><br>
\t\t<b>Sample checkout.</b> Site visitor stays on your calendar/website. Look may vary slightly depending on customizations.
\t\t<div id=\"ai1ec-tickets1\"></div>
\t\t<b>Sample receipt.</b> Look may vary slightly depending on customizations.
\t\t<div id=\"ai1ec-tickets2\"></div>
\t</div>
\t";
        }
        // line 23
        echo "</div>";
        // line 24
        echo "
";
    }

    public function getTemplateName()
    {
        return "ticketing/signup.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  55 => 24,  53 => 23,  36 => 8,  34 => 7,  31 => 6,  27 => 4,  22 => 2,  19 => 1,);
    }
}
