Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:54838 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754453AbZELVFo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 May 2009 17:05:44 -0400
Message-Id: <200905122102.n4CL2q6F007223@imap1.linux-foundation.org>
Subject: [patch 3/3] scripts/headers_check.pl: correct RE in header CONFIG leak check
From: akpm@linux-foundation.org
Date: Tue, 12 May 2009 13:43:36 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, rpjday@crashcourse.ca, dwmw2@infradead.org

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Correct the regular expression in scripts/headers_check.pl to include '_'
as a valid character in the class; otherwise, the check will report a
"leaked" symbol of CONFIG_A_B_C as merely CONFIG_A.

This patch will make no difference whatsoever in the current kernel tree
as the call to the perl routine that does that check is currently
commented out:

                &check_include();
                &check_asm_types();
                &check_sizetypes();
                &check_prototypes();
                # Dropped for now. Too much noise &check_config();

However, I noticed that problem when I was building the yum downloadable
kernel source rpm for fedora 11 (beta), which *does* run that check, and
that's where the problem became obvious.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/headers_check.pl |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN scripts/headers_check.pl~scripts-headers_checkpl-correct-re-in-header-config-leak-check scripts/headers_check.pl
--- a/scripts/headers_check.pl~scripts-headers_checkpl-correct-re-in-header-config-leak-check
+++ a/scripts/headers_check.pl
@@ -70,7 +70,7 @@ sub check_prototypes
 
 sub check_config
 {
-	if ($line =~ m/[^a-zA-Z0-9_]+CONFIG_([a-zA-Z0-9]+)[^a-zA-Z0-9]/) {
+	if ($line =~ m/[^a-zA-Z0-9_]+CONFIG_([a-zA-Z0-9_]+)[^a-zA-Z0-9_]/) {
 		printf STDERR "$filename:$lineno: leaks CONFIG_$1 to userspace where it is not valid\n";
 	}
 }
_
