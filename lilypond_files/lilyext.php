<?php
 
/*
 
	MediaWiki extension: LilyPond
	=============================
 
 
To activate, edit your LocalSettings.php, add
 
	require_once("$IP/extensions/LilyPond.php");
 
and make sure that the images/ directory is writable.
 
 
Example wiki code: <lilypond>\relative c' { c d e f g }</lilypond>
 
If you want to typeset a fragment with clickable midi, use
 
	<lilymidi>...</lilymidi>
 
If you want write a complete lilypond file, use
 
	<lilybook>...</lilybook>
 
 
Tested with Lilypond version 2.12.2.
 
*/
 
# User Settings

# The following variables can be set in LocalSettings.php
# before the line:
# require_once("$IP/extensions/LilyPond.php");

# You can set the variable $wgLilypond if you want/need to override the
# path to the Lilypond executable. For example:
# $wgLilypond = "/home/username/bin/lilypond";

# Add a text link to prompt user to listen to midi, before and/or after
# the image. Remember line breaks
# $wgLilypondPreMidi  = "Listen<br>";
# $wgLilypondPostMidi = "<br>Listen";  

# If you want to avoid trimming the resulting image, set $wgLilypondTrim
# to false.
# $wgLilypondTrim = false;

# You can put a white border around the image if you like.
# $wgLilypondBorderX = 10;
# $wgLilypondBorderY = 0;

# End User Settings

# Defaulting of user settings
if( !isset( $wgLilypond ) )
	$wgLilypond = "PATH=\$PATH:/usr/local/bin /usr/local/bin/lilypond";
 
if( !isset( $wgLilypondPreMidi ) )
	$wgLilypondPreMidi = "";
 
if( !isset( $wgLilypondPostMidi ) )
	$wgLilypondPostMidi = "";
 
if( !isset( $wgLilypondTrim ) ) {
	$wgLilypondTrim = true;
}
 
if( !isset( $wgLilypondBorderX ) ) {
	$wgLilypondBorderX = 0;
}
 
if( !isset( $wgLilypondBorderY ) ) {
	$wgLilypondBorderY = 0;
}
 
$wgExtensionFunctions[] = "wfLilyPondExtension";
 
function wfLilyPondExtension() {
	global $wgParser;
	$wgParser->setHook( "lilypond", "renderLilyPondFragment" );
	$wgParser->setHook( "lilymidi", "renderLilyPondMidiFragment" );
	$wgParser->setHook( "lilybook", "renderLilyPond" );
}
 
function renderLilyPondMidiFragment( $lilypond_code )
{
	return renderLilyPondFragment( $lilypond_code, true );
}
 
function renderLilyPondFragment( $lilypond_code, $midi=false )
{
	return renderLilyPond( "\\header {\n"
			. "\ttagline = ##f\n"
			. "}\n"
			. "\\paper {\n"
			. "\traggedright = ##t\n"
			. "\traggedbottom = ##t\n"
			. "\tindent = 0\mm\n"
			. "}\n"
			. "\\score {\n"
			. $lilypond_code
			. "\t\\layout { }\n"
			. ($midi?"\t\\midi { }\n":"")
			. "}\n", $lilypond_code );
}
 
function renderLilyPond( $lilypond_code, $short_code=false )
{
	global $wgMathPath, $wgMathDirectory, $wgTmpDirectory, $wgLilypond, $wgLilypondPreMidi, $wgLilypondPostMidii, $wgLilypondTrim, $wgLilypondBorderX, $wgLilypondBorderY;
 
	$mf   = wfMsg( "math_failure" );
	$munk = wfMsg( "math_unknown_error" );
 
	$fname = "renderMusic";
 
	$md5 = md5($lilypond_code);
 
	if( file_exists( $wgMathDirectory."/".$md5.".midi" ) ) {
                $pre = "<a href=\"".$wgMathPath."/".$md5.".midi\"> " . $wgLilypondPreMidi;
                $post = $wgLilypondPostMidi . " </a>";
	} else {
		$pre = "";
		$post = "";
	}
 
	# if short_code is supplied, this is a fragment
	if( $short_code ) {
		$link = "<img src=\"".$wgMathPath."/".$md5.".png\" alt=\""
			.htmlspecialchars( $short_code )."\">";
 
		if( file_exists( "$wgMathDirectory/$md5.png" ) ) {
			return $pre.$link.$post;
		}
	} else {
		if(  file_exists( "$wgMathDirectory/$md5-1.png" ) ) {
			$link="";
			for($i=1; file_exists( $wgMathDirectory . "/" .
						$md5 . "-" . $i . ".png" );
					$i++) {
 
				$link .= "<img src=\"" . $wgMathPath . "/" .
					$md5 . "-" . $i . ".png\" alt=\"" .
					htmlspecialchars( "page ".$i )."\">";
			}
			return $pre.$link.$post;
		}
	}
 
	# Ensure that the temp and output dirs are available before continuing.
	if( !file_exists( $wgMathDirectory ) ) {
		if( !@mkdir( $wgMathDirectory ) ) {
			return "<b>$mf (" . wfMsg( "math_bad_output" ) .
				$wgMathDirectory . ")</b>";
		}
	} elseif( !is_dir( $wgMathDirectory ) ||
			!is_writable( $wgMathDirectory ) ) {
		return "<b>$mf (" . wfMsg( "math_bad_output" ) . ")</b>";
	}
	if( !file_exists( $wgTmpDirectory ) ) {
		if( !@mkdir( $wgTmpDirectory ) ) {
			return "<b>$mf (" . wfMsg( "math_bad_tmpdir" )
				. ")</b>";
		}
	} elseif( !is_dir( $wgTmpDirectory ) ||
			!is_writable( $wgTmpDirectory ) ) {
		return "<b>$mf (" . wfMsg( "math_bad_tmpdir" ) . ")</b>";
	}
 
	$lyFile = $md5.".ly";
	$out = fopen( $wgTmpDirectory."/".$lyFile, "w" );
	if( $out === false ) {
		return "<b>$mf (" . wfMsg( "math_bad_tmpdir" ) . ")</b>";
	}
	fwrite( $out, $lilypond_code );
	fclose( $out );
 
	$cmd = $wgLilypond .
		" -dsafe='#t' -dbackend=eps --png --header=texidoc " .
		escapeshellarg($lyFile) . " 2>&1";
 
	wfDebug( "Lilypond: $cmd\n" );
	$oldcwd = getcwd();
	chdir( $wgTmpDirectory );
	$contents = exec( $cmd, $output, $ret );
	chdir( $oldcwd );
 
	if( $ret != 0 ) {
		return "<br><b>LilyPond error:</b><br><i>"
		. str_replace( array( $md5, " " ),
			array( "<b>your code</b>", "&nbsp;" ),
			nl2br( htmlentities( join( "\n", $output ) ) ) )
		. "</i><br>";
	}
 
	if($short_code) {
		$outputFile = $wgTmpDirectory."/".$md5.".png";
 
		if( !file_exists( $outputFile ) ) {
			return "<b>$mf (" . wfMsg( "math_image_error" )
				. ")</b>";
		}
 
		rename( $outputFile, $wgMathDirectory."/".$md5.".png");
	}
 
	# remove all temporary files
	$files = opendir( $wgTmpDirectory );
	$last_page = 0;
 
	while( false !== ($file = readdir( $files ))) {
		if( substr( $file, 0, 32 ) != $md5 )
			continue;
 
		$file_absolute = $wgTmpDirectory . "/" . $file;
		if( !$short_code && preg_match( '/-page(\d+)\.png$/',
					$file, $matches ) ) {
			if($matches[1]>$last_page)
				$last_page = $matches[1];
			rename( $file_absolute, $wgMathDirectory . "/" .
					$md5 . "-" . $matches[1] . ".png" );
			continue;
		}
 
                if( preg_match( '/.png$/', $file ) ) {
			rename( $file_absolute, $wgMathDirectory."/".$md5.".png" );
			continue;
                }
 
		if( preg_match( '/.midi$/', $file ) ) {
			rename( $file_absolute, $wgMathDirectory . "/" .
					$md5 . ".midi" );
                        $pre = "<a href=\"".$wgMathPath."/".$md5.".midi\"> " . $wgLilypondPreMidi;
                        $post = $wgLilypondPostMidi . " </a>";
			continue;
		}
 
		if( !is_file( $file_absolute ) )
			continue;
		unlink( $file_absolute );
	}
	closedir( $files );
 
	if( $short_code ) {
		if( !file_exists( $wgMathDirectory."/".$md5.".png" ) ) {
			$errmsg = wfMsg( "math_image_error" );
			return "<h3>$mf ($errmsg): " .
				htmlspecialchars($lilypond_code) . "</h3>";
		}
	} else {
                $link .= "<img src=\"".$wgMathPath."/".$md5.".png\" alt=\""
                . htmlspecialchars( "page " )."\">";
	}
 
	if( $wgLilypondTrim ) {
		$imgFile = $wgMathDirectory ."/" .$md5 . ".png";
		trimImage( $imgFile, $imgFile, 0xFFFFFF );
	};
 
	if( $wgLilypondBorderX > 0 || $wgLilypondBorderY > 0 ) {
                $imgFile = $wgMathDirectory ."/" .$md5 . ".png";
                frameImage( $imgFile, $imgFile, 0xFFFFFF, $wgLilypondBorderX, $wgLilypondBorderY );
        };
 
	return $pre . $link . $post;
}
 
function trimImage( $source, $dest, $bgColour )
{
  $srcImage = imagecreatefrompng( $source );
  $width = imagesx( $srcImage );
  $height = imagesy( $srcImage );
 
  $xmin = 0;
  $found = false;
  for( $x = 0; $x < $width && !$found; $x++ ) {
    for( $y = 0; $y < $height && !$found; $y++ ) {
      $rgb = imagecolorat( $srcImage, $x, $y );
      if( $rgb != $bgColour ) {
        $xmin = $x;
        $found = true;
      }
    }
  }
 
  $xmax = $xmin;
  $found = false;
  for( $x = $width-1; $x > $xmin && !$found; $x-- ) {
    for( $y = 0; $y < $height && !$found; $y++ ) {
      $rgb = imagecolorat( $srcImage, $x, $y );
      if( $rgb != $bgColour ) {
        $xmax = $x;
        $found = true;
      }
    }
  }
 
  $ymin = 0;
  $found = false;
  for( $y = 0; $y < $height && !$found; $y++ ) {
    for( $x = 0; $x < $width && !$found; $x++ ) {
      $rgb = imagecolorat( $srcImage, $x, $y );
      if( $rgb != $bgColour ) {
        $ymin = $y;
        $found = true;
      }
    }
  }
 
  $ymax = $ymin;
  $found = false;
  for( $y = $height-1; $y > $ymin && !$found; $y-- ) {
    for( $x = 0; $x < $width && !$found; $x++ ) {
      $rgb = imagecolorat( $srcImage, $x, $y );
      if( $rgb != $bgColour ) {
        $ymax = $y;
        $found = true;
      }
    }
  }
 
  $newWidth  = $xmax - $xmin + 1;
  $newHeight = $ymax - $ymin + 1;
 
  $dstImage = imagecreatetruecolor( $newWidth, $newHeight );
  imagecopy( $dstImage, $srcImage, 0, 0, $xmin, $ymin, $newWidth, $newHeight );
  imagepng( $dstImage, $dest );
}
 
function frameImage( $source, $dest, $bgColour, $borderWidth, $borderHeight )
{
  $srcImage = imagecreatefrompng( $source );
  $width = imagesx( $srcImage );
  $height = imagesy( $srcImage );
  $dstImage = imagecreatetruecolor( $width + 2*$borderWidth, $height + 2*$borderHeight );
  $allocatedBgColour = imagecolorallocate( $dstImage, ($bgColour >> 16) & 0xFF, ($bgColour >> 8) & 0xFF, $bgColour & 0xFF);
  imagefill( $dstImage, 0, 0, $allocatedBgColour );
  imagecopy( $dstImage, $srcImage, $borderWidth, $borderHeight, 0, 0, $width, $height );
  imagepng( $dstImage, $dest );
}

?>