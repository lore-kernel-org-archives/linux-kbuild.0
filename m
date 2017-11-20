Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:54207 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751945AbdKTSkm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 13:40:42 -0500
Date: Mon, 20 Nov 2017 10:40:40 -0800
From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] Check all .c files for bad kernel-doc comments
Message-ID: <20171120184040.GA21971@bombadil.infradead.org>
References: <20171027194149.14328-1-willy@infradead.org>
 <CAK7LNATB+mJgMi4sfxb04zYwE5hfv2zONiBHXXtk7wq=No4DNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATB+mJgMi4sfxb04zYwE5hfv2zONiBHXXtk7wq=No4DNw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>

On Mon, Oct 30, 2017 at 12:40:20PM +0900, Masahiro Yamada wrote:
> 2017-10-28 4:41 GMT+09:00 Matthew Wilcox <willy@infradead.org>:
> > From: Matthew Wilcox <mawilcox@microsoft.com>
> >
> > Implement a '-none' output mode for kernel-doc which will only output
> > warning messages, and suppresses the warning message about there being
> > no kernel-doc in the file.  Add it to the rule to build .o files from .c
> > files, so it will check all .c files that have been modified.
> >
> > Adds about 1300 warnings to my build, but will hopefully discourage
> > people from introducing more kerneldoc mistakes.
> 
> Basically, I think this is good,
> but it is controversial to sprinkle warnings by default.
> 
> Maybe,
> 
> ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
> cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $< ;
> endif

Thanks!  v2 below.  Jon, could you apply?

---- 8< ----


From 17d8fec833ac3cd52da412fe686911e10f77057c Mon Sep 17 00:00:00 2001
From: Matthew Wilcox <mawilcox@microsoft.com>
Date: Fri, 27 Oct 2017 14:24:55 -0400
Subject: [PATCH] Add optional check for bad kernel-doc comments

Implement a '-none' output mode for kernel-doc which will only output
warning messages, and suppresses the warning message about there being
no kernel-doc in the file.

If the build has requested additional warnings, automatically check all
.c files.  This patch does not check .h files.  Enabling the warning
by default would add about 1300 warnings, so it's default off for now.
People who care can use this to check they didn't break the docs and
maybe we'll get all the warnings fixed and be able to enable this check
by default in the future.

Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>
---
 scripts/Makefile.build |  5 +++++
 scripts/kernel-doc     | 25 ++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 061d0c3a420a..3fa7bd067557 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -108,6 +108,10 @@ ifneq ($(KBUILD_CHECKSRC),0)
   endif
 endif
 
+ifneq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
+  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $< ;
+endif
+
 # Do section mismatch analysis for each module/built-in.o
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
   cmd_secanalysis = ; scripts/mod/modpost $@
@@ -291,6 +295,7 @@ define rule_cc_o_c
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

