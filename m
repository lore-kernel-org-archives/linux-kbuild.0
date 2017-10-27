Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42931 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932135AbdJ0TmA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Oct 2017 15:42:00 -0400
From: Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] Check all .c files for bad kernel-doc comments
Date: Fri, 27 Oct 2017 12:41:49 -0700
Message-Id: <20171027194149.14328-1-willy@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: Matthew Wilcox <mawilcox@microsoft.com>

From: Matthew Wilcox <mawilcox@microsoft.com>

Implement a '-none' output mode for kernel-doc which will only output
warning messages, and suppresses the warning message about there being
no kernel-doc in the file.  Add it to the rule to build .o files from .c
files, so it will check all .c files that have been modified.

Adds about 1300 warnings to my build, but will hopefully discourage
people from introducing more kerneldoc mistakes.

Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>
---
 scripts/Makefile.build |  3 +++
 scripts/kernel-doc     | 25 ++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 061d0c3a420a..f0f907af53c7 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -108,6 +108,8 @@ ifneq ($(KBUILD_CHECKSRC),0)
   endif
 endif
 
+cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $< ;
+
 # Do section mismatch analysis for each module/built-in.o
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
   cmd_secanalysis = ; scripts/mod/modpost $@
@@ -291,6 +293,7 @@ define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
 	$(call cmd_and_fixdep,cc_o_c)					  \
 	$(cmd_modversions_c)						  \
+	$(cmd_checkdoc)							  \
 	$(call echo-cmd,objtool) $(cmd_objtool)				  \
 	$(call echo-cmd,record_mcount) $(cmd_record_mcount)
 endef
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 9d3eafea58f0..c69583440a44 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -58,6 +58,7 @@ Output format selection (mutually exclusive):
   -man			Output troff manual page format. This is the default.
   -rst			Output reStructuredText format.
   -text			Output plain text format.
+  -none			Do not output documentation, only warnings.
 
 Output selection (mutually exclusive):
   -export		Only output documentation for symbols that have been
@@ -532,6 +533,8 @@ while ($ARGV[0] =~ m/^-(.*)/) {
 	$output_mode = "gnome";
 	@highlights = @highlights_gnome;
 	$blankline = $blankline_gnome;
+    } elsif ($cmd eq "-none") {
+	$output_mode = "none";
     } elsif ($cmd eq "-module") { # not needed for XML, inherits from calling document
 	$modulename = shift @ARGV;
     } elsif ($cmd eq "-function") { # to only output specific functions
@@ -2117,6 +2120,24 @@ sub output_blockhead_list(%) {
     }
 }
 
+
+## none mode output functions
+
+sub output_function_none(%) {
+}
+
+sub output_enum_none(%) {
+}
+
+sub output_typedef_none(%) {
+}
+
+sub output_struct_none(%) {
+}
+
+sub output_blockhead_none(%) {
+}
+
 ##
 # generic output function for all types (function, struct/union, typedef, enum);
 # calls the generated, variable output_ function name based on
@@ -3136,7 +3157,9 @@ sub process_file($) {
 	}
     }
     if ($initial_section_counter == $section_counter) {
-	print STDERR "${file}:1: warning: no structured comments found\n";
+	if ($output_mode ne "none") {
+	    print STDERR "${file}:1: warning: no structured comments found\n";
+	}
 	if (($output_selection == OUTPUT_INCLUDE) && ($show_not_found == 1)) {
 	    print STDERR "    Was looking for '$_'.\n" for keys %function_table;
 	}
-- 
2.11.0.301.g722e3be85.dirty

