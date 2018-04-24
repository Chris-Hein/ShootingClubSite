<?php 
	/*
		Template Name: Fullwidht Template
	*/
get_header(); ?>

<!--Breadcrumbs for the fullwidth page-->

<div class="breadcrumbs fix">
		<h4>You are here: <a href="<?php echo site_url(); ?>">Home</a>/ <?php the_title(); ?></h4>
</div> <!-- end .breadcrumbs-->

<!--Posts will appear here-->
<div class="wrapper">
	<?php if(have_posts()) : ?><?php while(have_posts())  : the_post(); ?>
	<div class="full_page fix">
	
		<?php the_content(); ?>
			 
		<?php endwhile; ?>
		<?php else : ?>
			<h3><?php _e('404 Error&#58; Not Found', 'thirteenmag'); ?></h3>
		<?php endif; ?>
	</div>
</div>
<?php get_footer(); ?>