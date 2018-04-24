<?php

/**
 * Thirteenmag functions and definitions
 *
 * Sets up the theme and provides some helper functions. 
 *
 * @package Thirteenmag
 */

/**
 * Register widgetized area and update sidebar with default widgets
 */
function thirteenmag_widget_areas() {
	register_sidebar( array(
        'name' => __( 'Top Sidebar', 'thirteenmag' ),
        'id' => 'right_sidebar',
        'before_widget' => '<div class="single_widget fix">',
        'after_widget' => '</div>',
        'before_title' => '<div class="widget_title"><h3>',
        'after_title' => '</h3></div>',
    ) );
};

add_action('widgets_init', 'thirteenmag_widget_areas');



/**
 * Enqueue scripts and styles
 */
function thirteenmag_scripts() {
	
	wp_enqueue_style( 'thirteenmag_font-awesome', get_template_directory_uri() . '/css/font-awesome.min.css', array(), '1' );
	wp_enqueue_style( 'thirteenmag_bootstrap', get_template_directory_uri() . '/css/bootstrap.min.css', array(), '1' );
	wp_enqueue_style( 'thirteenmag_slicknav', get_template_directory_uri() . '/css/slicknav.css', array(), '1' );
	wp_enqueue_style( 'thirteenmag_normalize', get_template_directory_uri() . '/css/normalize.css', array(), '1' );
	wp_enqueue_style( 'thirteenmag_maincss', get_template_directory_uri() . '/css/thirteenmag.css', array(), '1' );
	wp_enqueue_style( 'thirteenmag_responsive', get_template_directory_uri() . '/css/responsive.css', array(), '1' );


	wp_enqueue_style( 'thirteenmag-style', get_stylesheet_uri(), array( 'thirteenmag' ) );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
	
	wp_enqueue_script( 'thirteenmag_plugin', get_template_directory_uri() . '/js/plugins.js', array( 'jquery' ), '20140616', true );
	wp_enqueue_script( 'thirteenmag_bootstrap_js', get_template_directory_uri() . '/js/bootstrap.min.js', array( 'jquery' ), '20140616', true );
	wp_enqueue_script( 'thirteenmag_slicknav_js', get_template_directory_uri() . '/js/jquery.slicknav.min.js', array( 'jquery' ), '20140616', true );
	wp_enqueue_script( 'thirteenmag_fitvids_js', get_template_directory_uri() . '/js/jquery.fitvids.js', array( 'jquery' ), '20140616', true );
	wp_enqueue_script( 'thirteenmag_main_js', get_template_directory_uri() . '/js/main.js', array( 'jquery' ), '20140616', true );
}
add_action( 'wp_enqueue_scripts', 'thirteenmag_scripts' );


/*********************************************/
/*					LOAD GOOGLE FONTS 		*/
/*********************************************/

function thirteenmag_load_fonts() {
	
            wp_register_style('thirteenmag_roboto_fonts', '//fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300');
            wp_enqueue_style( 'thirteenmag_roboto_fonts');
            wp_register_style('thirteenmag_lato_fonts', '//fonts.googleapis.com/css?family=Lato:400,300,700,900');
            wp_enqueue_style( 'thirteenmag_lato_fonts');
            wp_register_style('thirteenmag_lobstar_fonts', '//fonts.googleapis.com/css?family=Lobster');
            wp_enqueue_style( 'thirteenmag_lobstar_fonts');
            wp_register_style('thirteenmag_tangerine_fonts', '//fonts.googleapis.com/css?family=Tangerine:400,700');
            wp_enqueue_style( 'thirteenmag_tangerine_fonts');
            wp_register_style('thirteenmag_open_sans', '//fonts.googleapis.com/css?family=Open+Sans');
            wp_enqueue_style( 'thirteenmag_open_sans');
}
add_action('wp_print_styles', 'thirteenmag_load_fonts');


/**
 * Replaces the excerpt "more" text by a link
 */
function thirteenmag_excerpt_more($more) {
       global $post;
	return '<a class="moretag" href="'. get_permalink($post->ID) . '">Continue... </a>';
}
add_filter('excerpt_more', 'thirteenmag_excerpt_more');



/**
 * Pagination Code
 */
function thirteenmag_pagination($pages = '', $range = 4)
    {  
         $showitems = ($range * 2)+1;  

         global $paged;
         if(empty($paged)) $paged = 1;

         if($pages == '')
         {
             global $wp_query;
             $pages = $wp_query->max_num_pages;
             if(!$pages)
             {
                 $pages = 1;
             }
         }   

         if(1 != $pages)
         {
             echo "<div class=\"pagination\"><span>Page ".$paged." of ".$pages."</span>";
             if($paged > 2 && $paged > $range+1 && $showitems < $pages) echo "<a href='".get_pagenum_link(1)."'>&laquo; First</a>";
             if($paged > 1 && $showitems < $pages) echo "<a href='".get_pagenum_link($paged - 1)."'>&lsaquo; Previous</a>";

             for ($i=1; $i <= $pages; $i++)
             {
                 if (1 != $pages &&( !($i >= $paged+$range+1 || $i <= $paged-$range-1) || $pages <= $showitems ))
                 {
                     echo ($paged == $i)? "<span class=\"current\">".$i."</span>":"<a href='".get_pagenum_link($i)."' class=\"inactive\">".$i."</a>";
                 }
             }

             if ($paged < $pages && $showitems < $pages) echo "<a href=\"".get_pagenum_link($paged + 1)."\">Next &rsaquo;</a>";  
             if ($paged < $pages-1 &&  $paged+$range-1 < $pages && $showitems < $pages) echo "<a href='".get_pagenum_link($pages)."'>Last &raquo;</a>";
             echo "</div>\n";
         }
    } 


/**
 * Thirteenmag theme uses wp_nav_menu.
 */
function thirteenmag_setup() {
    if (function_exists('register_nav_menu')) {
        register_nav_menu( 'main-menu', __( 'Main Menu', 'thirteenmag') );
    }

/**
 * Add default posts and comments RSS feed links to head
 */
	add_theme_support('automatic-feed-links');

	
/**
 * Set the content width based on the Thirteenmag theme's design and stylesheet.
 */	
	if ( ! isset( $content_width ) ) 
		$content_width = 960;
	
/**
 * Setup the WordPress core custom header feature.
 */	
	$args = array(
	'width'         => 450,
	'height'        => 79,
	'uploads'       => true,
);
add_theme_support( 'custom-header', $args );
	
/**
 * Setup the WordPress core custom background feature.
 */
	
	$args = array(
		'default-color' => 'ffffff',
	);
	add_theme_support( 'custom-background', $args );

	
/*
* Document title.
*/
	add_theme_support( 'title-tag' );
	
/**
 * This theme styles the visual editor with editor-style.css to match the theme style.
 */
	add_editor_style();
	
}
add_action('init', 'thirteenmag_setup');


/**
 * Enable support for Post Thumbnails on posts and pages
 *
 * @link http://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
 *
 * Enable support for Post Formats
 */
	add_theme_support( 'post-thumbnails', array( 'post') );
	set_post_thumbnail_size( 300, 300, true ); // Normal post thumbnails, hard crop mode
	add_image_size( 'post-thumb', 250, 180, true );


/**
 * Custom Function for Displaying Comments 
 */
function thirteenmag_comments($comment, $args, $depth) {
	$GLOBALS['comment'] = $comment;

	if (get_comment_type() == 'pingback' || get_comment_type() == 'trackback') : ?>
	
		<li class="pingback" id="comment-<?php comment_ID(); ?>">

			<article <?php comment_class('clearfix'); ?>>
			
				<header>
				
					<h4><?php _e('Pingback:', 'thirteenmag'); ?></h4>
					<p><?php edit_comment_link(); ?></p>
					
				</header>
	
				<?php comment_author_link(); ?>
								
			</article>
		
	<?php endif; ?>
	
	<?php if (get_comment_type() == 'comment') : ?>
		<li id="comment-<?php comment_ID(); ?>">
	
			<article <?php comment_class('clearfix'); ?>>
			
				<header>
				
					<h4><span><?php _e('AUTHOR', 'thirteenmag'); ?></span><?php comment_author_link(); ?></h4>
					<p><span>on <?php comment_date(); ?> at <?php comment_time(); ?> - </span><?php comment_reply_link(array_merge($args, array('depth' => $depth, 'max_depth' => $args['max_depth']))); ?></p>
					
				</header>
	
				<figure class="comment-avatar">
					<?php 
						$avatar_size = 80;
						if ($comment->comment_parent != 0) {
							$avatar_size = 48;
						}
						
						echo get_avatar($comment, $avatar_size);
					?>
				</figure>
				
				<?php if ($comment->comment_approved == '0') : ?>
				
					<p class="awaiting-moderation"><?php _e('Your comment is awaiting moderation.', 'thirteenmag'); ?></p>
					
				<?php endif; ?>

				<?php comment_text(); ?>
								
			</article>
			
	<?php endif;	
}




/**
* Custom Comment Form 
*/
function thirteenmag_custom_comment_form($defaults) {
	$comment_notes_after = '' .
		'<div class="allowed-tags">' .
		'<p><strong>' . __('Allowed Tags', 'thirteenmag') . '</strong></p>' .
		'<code> ' . allowed_tags() . ' </code>' .
		'</div> <!-- end allowed-tags -->';
	
	$defaults['comment_notes_before'] = '';
	$defaults['comment_notes_after'] = $comment_notes_after;
	$defaults['id_form'] = 'comment-form';
	$defaults['comment_field'] = '<p><textarea name="comment" id="comment" cols="30" rows="10"></textarea></p>';

	return $defaults;
}

add_filter('comment_form_defaults', 'thirteenmag_custom_comment_form');

function thirteenmag_custom_comment_fields() {
	$commenter = wp_get_current_commenter();
	$req = get_option('require_name_email');
	$aria_req = ($req ? " aria-required='true'" : '');
	
	$fields = array(
		'author' => '<p>' . 
						'<input id="author" name="author" type="text" value="' . esc_attr($commenter['comment_author']) . '" ' . $aria_req . ' />' .
						'<label for="author">' . __('Name', 'thirteenmag') . '' . ($req ? __(' (required)', 'thirteenmag') : '') . '</label>' .
		            '</p>',
		'email' => '<p>' . 
						'<input id="email" name="email" type="text" value="' . esc_attr($commenter['comment_author_email']) . '" ' . $aria_req . ' />' .
						'<label for="email">' . __('Email', 'thirteenmag') . '' . ($req ? __(' (required) (will not be published)', 'thirteenmag') : '') . '</label>' .
		            '</p>',
		'url' => '<p>' . 
						'<input id="url" name="url" type="text" value="' . esc_attr($commenter['comment_author_url']) . '" />' .
						'<label for="url">' . __('Website', 'thirteenmag') . '</label>' .
		            '</p>'
	);

	return $fields;
}

add_filter('comment_form_default_fields', 'thirteenmag_custom_comment_fields');


/*
Show Recent Comments on widget
*/
function thirteenmag_bg_recent_comments($no_comments = 5, $comment_len = 80, $avatar_size = 48) {
	$comments_query = new WP_Comment_Query();
	$comments = $comments_query->query( array( 'number' => $no_comments ) );
	$comm = '';
	if ( $comments ) : foreach ( $comments as $comment ) :
		$comm .= '<li><a class="author" href="' . get_permalink( $comment->comment_post_ID ) . '#comment-' . $comment->comment_ID . '">';
		$comm .= get_avatar( $comment->comment_author_email, $avatar_size );
		$comm .= get_comment_author( $comment->comment_ID ) . ':</a> ';
		$comm .= '<p>' . strip_tags( substr( apply_filters( 'get_comment_text', $comment->comment_content ), 0, $comment_len ) ) . '...</p></li>';
	endforeach; else :
		$comm .= 'No comments.';
	endif;
	echo $comm;	
}




?>