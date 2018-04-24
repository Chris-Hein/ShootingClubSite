<?php get_header(); ?>
	<div class="breadcrumbs fix">
			<h4>You are here: <a href="<?php echo site_url(); ?>">Home</a>/ <?php the_title(); ?></h4>
	</div>
	<div class="wrapper">

			<div class="mainsection floatleft fix">
				<?php if(have_posts()) : ?>
					<?php get_template_part('post-loop'); ?>
					
					<?php else : ?>
					<h3><?php _e('Sorry, content not found', 'thirteenmag'); ?></h3>
				<?php endif; ?>
			</div>
		
		<?php get_sidebar(); ?>
		
	</div>

<?php get_footer(); ?>