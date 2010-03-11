Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:60917 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758249Ab0CKWFf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Mar 2010 17:05:35 -0500
Message-Id: <201003112205.o2BM5ELf013286@imap1.linux-foundation.org>
Subject: [patch 1/2] markup_oops: fix perlcritic warnings
From: akpm@linux-foundation.org
Date: Thu, 11 Mar 2010 14:05:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, shemminger@vyatta.com, amwang@redhat.com, arjan@infradead.org

From: Stephen Hemminger <shemminger@vyatta.com>

Turn on strict checking.
Use local file handles and 3 argument open.

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
Acked-by: WANG Cong <amwang@redhat.com>
Cc: Arjan van de Ven <arjan@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/markup_oops.pl |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff -puN scripts/markup_oops.pl~markup_oops-fix-perlcritic-warnings scripts/markup_oops.pl
--- a/scripts/markup_oops.pl~markup_oops-fix-perlcritic-warnings
+++ a/scripts/markup_oops.pl
@@ -1,5 +1,7 @@
 #!/usr/bin/perl
 
+use strict;
+
 use File::Basename;
 use Math::BigInt;
 use Getopt::Long;
@@ -126,7 +128,7 @@ sub process_x86_regs
 		$clobber = "";
 	}
 
-	foreach $reg (keys(%regs)) {
+	foreach my $reg (keys(%regs)) {
 		my $clobberprime = reg_name($clobber);
 		my $lastwordprime = reg_name($lastword);
 		my $val = $regs{$reg};
@@ -263,7 +265,7 @@ while (<FILE>) {
 	}
 }
 
-close(FILE);
+close($file);
 
 if ($counter == 0) {
 	print "No matching code found \n";
_
