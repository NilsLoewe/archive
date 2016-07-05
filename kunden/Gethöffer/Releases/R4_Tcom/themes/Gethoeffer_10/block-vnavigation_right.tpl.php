<?php if (isset($block->content)): ?>
  <div class="art-vmenublock">
    <div class="art-vmenublock-tl"></div>
    <div class="art-vmenublock-tr"></div>
    <div class="art-vmenublock-bl"></div>
    <div class="art-vmenublock-br"></div>
    <div class="art-vmenublock-tc"></div>
    <div class="art-vmenublock-bc"></div>
	  <div class="art-vmenublock-cl"></div>
	  <div class="art-vmenublock-cr"></div>
	  <div class="art-vmenublock-cc"></div>
    
	  <div class="art-vmenublock-body">
	  <?php if (!empty($block->subject)): ?>
		  <div class="art-vmenublockheader">
			  <div class="l"></div>
			  <div class="r"></div>
			  <div class="t"><?php echo $block->subject; ?></div>
		  </div>
	  <?php endif;?>
	  <div class="art-vmenublockcontent">
      <div class="art-vmenublockcontent-tl"></div>
      <div class="art-vmenublockcontent-tr"></div>
      <div class="art-vmenublockcontent-bl"></div>
      <div class="art-vmenublockcontent-br"></div>
      <div class="art-vmenublockcontent-tc"></div>
      <div class="art-vmenublockcontent-bc"></div>
      <div class="art-vmenublockcontent-cl"></div>
      <div class="art-vmenublockcontent-cr"></div>
      <div class="art-vmenublockcontent-cc"></div>
      
		  <div class="art-vmenublockcontent-body">
			  <!-- block-content -->
			  <div class="art-vmenu">
          <?php echo art_menu_worker($block->content, true, 'art-vmenu');?>
          <div class="cleared"></div>
			  </div>
			  <!-- /block-content -->
			  <div class="cleared"></div>
		  </div>
	  </div>
    <div class="cleared"></div>
    </div>
  </div>
<?php endif; ?>