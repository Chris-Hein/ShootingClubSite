<?php if(have_posts()) : ?>

<?php while (have_posts()) : the_post(); ?>        
	 
	<div <?php post_class('single_post fix'); ?> id="post-<?php the_ID();  ?>">
	 
		<h1><a href="<?php the_permalink(); ?> "><?php the_title(); ?></a></h1>

		
		<div class="post_meta fix">
			<ul>
				<li class="post_cat"><?php the_category('&nbsp;&nbsp;/&nbsp&nbsp;'); ?></li>
				<li class="post_author"><?php the_author_posts_link(); ?></li>
				<li class="tag"><?php _e('', 'thirteenmag'); ?>&nbsp; <?php the_tags(); ?> </li>
				<li class="post_date"><?php the_date(get_option('date_formate')); ?></li>
				<li class="post_comments">
					
					<?php if (comments_open() && !post_password_required()) { ?><i class="fa fa-comments"></i> <?php comments_popup_link('0', '1', '%'); } ?>
				</li>
			</ul>
		</div>
		
		<div class="post_thumbnail fix">
			<?php if (has_post_thumbnail()) : ?>
				<div class="post-image">
					<a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('post-thumb'); ?></a>
				</div>
				
			<?php endif; ?>
		</div>
		<div class="post_content fix">
			<?php the_excerpt();?>
		</div>
		

	</div>

<?php endwhile; else : ?>
	<article id="post-<?php the_ID(); ?>" <?php post_class('no-posts'); ?>>

		<h1><?php _e('No posts were found.', 'thirteenmag'); ?></h1>
		
	</article>
<?php endif; ?>
	
	<?php if (function_exists("thirteenmag_pagination")) {
    thirteenmag_pagination($wp_query->max_num_pages);
} ?>