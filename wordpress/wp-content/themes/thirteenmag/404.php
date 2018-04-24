<?php
/**
 * The template for displaying 404 pages (Not Found)
 * @package Thirteenmag
 * @since Thirteenmag 1.0
 */
get_header(); ?>
	<div class="breadcrumbs fix">
			<h4>You are here: <a href="<?php echo site_url(); ?>">Home</a>/<?php the_title(); ?></h4>
	</div>
	<div class="wrapper">
	
			<div class="mainsection floatleft fix">

					
				 <div class="not-found fix">
			
					<h3>404 Error: Not Found</h3>
					<p>Sorry, but the page you are trying to reach is unavailable or does not exist.</p>

				</div>
			</div> <!-- end mainsection-->
			
		<?php get_sidebar(); ?>
		
	</div>
	
	<?php get_footer(); ?>