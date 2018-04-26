<?php
/**
 * The template for displaying all pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package Thirteenmag
 
 * @since Thirteenmag 1.0
 */
get_header(); ?>
	<!-- Show Breadcrumbs-->
	<div class="breadcrumbs fix">
			<h4>You are here: <a href="<?php echo site_url(); ?>">Home</a>/ <?php the_title(); ?></h4>
	</div>
	<!--Starting Posts of pages from here -->
	<div class="wrapper">
	
		    
		
			<div class="mainsection floatleft fix">
				<?php if(have_posts()) : ?>
				<?php while(have_posts())  : the_post(); ?>
				
				    <?php the_content(); ?>
				 
                <?php endwhile; ?>
                
                <?php else : ?>
                    <h3><?php _e('404 Error&#58; Not Found', 'thirteenmag'); ?></h3>
                <?php endif; ?>
                
		    </div>
		
		    <?php get_sidebar(); ?>
		
	</div> <!--End Wrapper-->
	
	<?php get_footer(); ?>