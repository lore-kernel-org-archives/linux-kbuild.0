Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:45614 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752555AbZFFIg2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 6 Jun 2009 04:36:28 -0400
Date: Sat, 6 Jun 2009 10:38:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 18/39] kbuild/headers_check: refine extern check
Message-ID: <20090606083844.GA14555@uranus.ravnborg.org>
References: <20090605233720.GA13588@uranus.ravnborg.org> <1244245377-17441-18-git-send-email-sam@ravnborg.org> <200906060046.07421.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200906060046.07421.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Amerigo Wang <amwang@redhat.com>

On Sat, Jun 06, 2009 at 12:46:07AM +0000, Arnd Bergmann wrote:
> On Friday 05 June 2009 11:42:36 pm Sam Ravnborg wrote:
> > From: Amerigo Wang <amwang@redhat.com>
> > 
> > 'extern' checking information is not clear, refine it.
> > Plus, fix a comment.
> > 
> > Signed-off-by: WANG Cong <amwang@redhat.com>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I still think this is pointless and should just be removed
> (or replaced with a patch to kill the apostrophe in there).

So you wanted me to visit that link...
I redid it like this:

Subject: kbuild/headers_check: refine extern check

'extern' checking information is not clear, refine it.
Plus, fix a comment.

Signed-off-by: WANG Cong <amwang@redhat.com>
[sam: redid the extern error message]
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
diff --git a/scripts/headers_check.pl b/scripts/headers_check.pl
index 4414c43..db1dd7a 100644
--- a/scripts/headers_check.pl
+++ b/scripts/headers_check.pl
@@ -2,7 +2,7 @@
 #
 # headers_check.pl execute a number of trivial consistency checks
 #
-# Usage: headers_check.pl dir [files...]
+# Usage: headers_check.pl dir arch [files...]
 # dir:   dir to look for included files
 # arch:  architecture
 # files: list of files to check
@@ -37,7 +37,7 @@ foreach my $file (@files) {
 		&check_include();
 		&check_asm_types();
 		&check_sizetypes();
-		&check_prototypes();
+		&check_declarations();
 		# Dropped for now. Too much noise &check_config();
 	}
 	close FH;
@@ -61,10 +61,12 @@ sub check_include
 	}
 }
 
-sub check_prototypes
+sub check_declarations
 {
-	if ($line =~ m/^\s*extern\b/) {
-		printf STDERR "$filename:$lineno: extern's make no sense in userspace\n";
+	if ($line =~m/^\s*extern\b/) {
+		printf STDERR "$filename:$lineno: " .
+		              "userspace cannot call function or variable " .
+		              "defined in the kernel\n";
 	}
 }
 
