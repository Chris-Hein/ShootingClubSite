<?php

/***********************************************************************************************/
/* Prevent the direct loading of comments.php */
/***********************************************************************************************/
if (!empty($_SERVER['SCRIPT-FILENAME']) && basename($_SERVER['SCRIPT-FILENAME']) == 'comments.php') {
	die(__('You cannot access this page directly.', 'thirteenmag'));
}

/***********************************************************************************************/
/* If the post is password protected then display text and return */
/***********************************************************************************************/
if (post_password_required()) : ?>
	<p>
		<?php 
			_e( 'This post is password protected. Enter the password to view the comments.', 'thirteenmag');
			return;
		?>
	</p>

<?php endif;

/***********************************************************************************************/
/* If we have comments to display, we display them */
/***********************************************************************************************/
if (have_comments()) : ?>
		<a href="#respond" class="article-add-comment"></a>
		<h3><?php comments_number(__('No Comments', 'thirteenmag'), __('One Comment', 'thirteenmag'), __('% Comments', 'thirteenmag')); ?></h3>

		<ol class="commentslist">
			<?php wp_list_comments('callback=thirteenmag_comments'); ?>
		</ol>

		<?php if (get_comment_pages_count() > 1 && get_option('page_comments')) : ?>
		
			<div class="comment-nav-section clearfix">
			
				<p class="fl"><?php previous_comments_link(__( '&larr; Older Comments', 'thirteenmag')); ?></p>
				<p class="fr"><?php next_comments_link(__( 'Newer Comments &rarr;', 'thirteenmag')); ?></p>
				
			</div> <!-- end comment-nav-section -->
		
		<?php endif; ?>

<?php
/***********************************************************************************************/
/* If we don't have comments and the comments are closed, display a text */
/***********************************************************************************************/

	elseif (!comments_open() && !is_page() && post_type_supports(get_post_type(), 'comments')) : ?>
	
<?php endif; 

/***********************************************************************************************/
/* Display the comment form */
/***********************************************************************************************/
comment_form();

?>