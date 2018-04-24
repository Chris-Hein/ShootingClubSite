<?php
/**
 * The Header template for our theme
 *
 * Displays all of the <head> section and everything up
 *
 * @package Thirteenmag
 
 * @since Thirteenmag 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="<?php bloginfo('charset'); ?>">
		<meta name="description" content="<?php bloginfo('description'); ?>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<!-- Pingbacks -->
		<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
		
		<?php wp_head();?>
		
    </head>
    <body <?php body_class(); ?>>
	

	<div class="logo_area">
		<div class="logo_bg">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="logo">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<?php if ( display_header_text() ) : // If user chooses to display header text. ?>
								<a href="<?php echo site_url(); ?>"><?php echo bloginfo('name'); ?></a>
								<?php 
									$description = get_bloginfo( 'description', 'display' );
								if ( $description || is_customize_preview() ) : ?>
									<p class="site-description"><?php echo $description; ?>
								<?php endif; ?>
									</p>
							<?php endif; ?>
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
							<?php if (get_header_image()): ?>
								<div class="header_image">
									<a href="<?php echo site_url(); ?>">
										<img src="<?php header_image(); ?>" height="<?php echo get_custom_header()->height; ?>" width="<?php echo get_custom_header()->width; ?>" alt="" />
									</a>
								</div>
							<?php endif; ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="sticker" class="mainmenu_area">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="mainmenu">
					<?php wp_nav_menu( array( 'theme_location' => 'main-menu') ); ?>
				</div>
				<a class="small_device_menu" href="#"><img src="<?php echo get_template_directory_uri(); ?>/images/nav.png" alt="" /><?php _e('navigation', 'thirteenmag'); ?></a>
				<div class="small_menu_area"></div> <!--end small_menu_area-->
			</div>
		</div>
	</div>
	
	