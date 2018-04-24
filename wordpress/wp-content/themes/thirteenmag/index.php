<?php
/**
 * The main template file
 * @package Thirteenmag
 * @since Thirteenmag 1.0
 */

 get_header(); ?>
	
	<div class="wrapper">
		
		<div class="mainsection fix">
			
			<?php get_template_part('post-loop'); ?>
			<?php get_template_part( 'pagenav' ); // Page Navigation (pagenav.php) ?>
			
		</div>
		
		<?php get_sidebar(); ?>
		
	</div>
	
	<?php get_footer(); ?>