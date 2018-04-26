<?php
/**
 * The Template for displaying all single posts
 *
 * @package Thirteenmag
 
 * @since Thirteenmag 1.0
 */
get_header(); ?>
	
	<div class="wrapper">
	
		<?php if(have_posts()) : ?><?php while(have_posts())  : the_post(); ?>
		
		
			<div class="mainsection floatleft fix">
				<div class="single_post_area fix">
				
					<h2><?php the_title(); ?></h2>
					 <?php the_content(); ?>
					 <!-- Displaying post pagination links in case we have multiple page posts -->
						<?php wp_link_pages('before=<div class="post-pagination">&after=</div>&pagelink=Page %'); ?>
					 <?php comments_template( '', true ); ?> 
					 
				</div>
			</div>
		<?php endwhile; ?>
							 
		<?php else : ?>
			<h3><?php _e('404 Error&#58; Not Found', 'thirteenmag'); ?></h3>
		<?php endif; ?>
		
		<?php get_sidebar(); ?>
		
	</div> <!-- end .wrapper-->
	
	<?php get_footer(); ?>