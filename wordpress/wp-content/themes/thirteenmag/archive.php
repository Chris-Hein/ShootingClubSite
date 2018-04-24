<?php
/**
 * The template for displaying archive pages
 * @package Thirteenmag
 * @since Thirteenmag 1.0
 */
get_header(); ?>

	<div class="wrapper">

			<div class="mainsection floatleft fix">
													<h1 class="archive">
								<?php if (have_posts()) : ?>
								
									<?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
										<?php /* If this is a category archive */ if (is_category()) { ?>
										
										<div class="archive_short_category">
											<?php _e('Category', 'thirteenmag'); ?>
										</div>
										
										<div class="archive_title_category">
											<?php echo single_cat_title(); ?>
										</div>
										
										
										<?php /* If this is a tag archive */  } elseif( is_tag() ) { ?>
											<div class="archive_short_category">
												<?php _e('Tag', 'thirteenmag'); ?>
											</div>
											
											<div class="archive_title_category">
												<?php single_tag_title(); ?>
											</div>
											
										<?php /* If this is a daily archive */ } elseif (is_day()) { ?>
											<div class="archive_short_category">
												<?php _e('Archive For', 'thirteenmag'); ?>
											</div>
											
											<div class="archive_title_category">
												<?php the_time(get_option('F jS, Y')); ?>
											</div>
										<?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
											<div class="archive_short_category">
												<?php _e('Archive For', 'thirteenmag'); ?>
											</div>
											
											<div class="archive_title_category">
												<?php the_time(get_option('m')); ?>
											</div>
										<?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
											<div class="archive_short_category">
												<?php _e('Archive For', 'thirteenmag'); ?>
											</div>
											
											<div class="archive_title_category">
												<?php the_time(get_option('Y')); ?>
											</div>
											
										<?php /* If this is a search */ } elseif (is_search()) { ?>
											<div class="archive_short_category">
												<?php _e('Search results', 'thirteenmag'); ?>
											</div>
										<?php /* If this is an author archive */ } elseif (is_author()) { ?>
											<div class="archive_short_category">
												<?php _e('Author Archive', 'thirteenmag'); ?>
											</div>
										<?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
											<div class="archive_short_category">
												<?php _e('Blog Archive', 'thirteenmag'); ?>
											</div>    
								<?php } ?>
							</h1>



				<?php get_template_part('post-loop'); ?>
				
				<?php else : ?>
				<h3><?php _e('404 Error&#58; Not Found', 'thirteenmag'); ?></h3>
				<?php endif; ?>
			</div> <!-- end mainsection-->
		
		<?php get_sidebar(); ?>
		
	</div> <!--End Wrapper-->

<?php get_footer(); ?>
