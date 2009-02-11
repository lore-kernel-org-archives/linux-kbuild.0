Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38715 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756695AbZBKVLk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Feb 2009 16:11:40 -0500
Message-Id: <200902112111.n1BLAxVl008391@imap1.linux-foundation.org>
Subject: [patch for 2.6.29? 1/1] bootgraph: fix for use with dot symbols
From: akpm@linux-foundation.org
Date: Wed, 11 Feb 2009 13:10:59 -0800
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, mikey@neuling.org, arjan@linux.intel.com

From: Michael Neuling <mikey@neuling.org>

powerpc has dot symbols, so the dmesg output looks like:

<4>[    0.327310] calling  .migration_init+0x0/0x9c @ 1
<4>[    0.327595] initcall .migration_init+0x0/0x9c returned 1 after 0 usecs

The below fixes bootgraph.pl so it handles this correctly.

Signed-off-by: Michael Neuling <mikey@neuling.org>
Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/bootgraph.pl |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/bootgraph.pl~bootgraph-fix-for-use-with-dot-symbols scripts/bootgraph.pl
--- a/scripts/bootgraph.pl~bootgraph-fix-for-use-with-dot-symbols
+++ a/scripts/bootgraph.pl
@@ -51,7 +51,7 @@ my %pidctr;
 
 while (<>) {
 	my $line = $_;
-	if ($line =~ /([0-9\.]+)\] calling  ([a-zA-Z0-9\_]+)\+/) {
+	if ($line =~ /([0-9\.]+)\] calling  ([a-zA-Z0-9\_\.]+)\+/) {
 		my $func = $2;
 		if ($done == 0) {
 			$start{$func} = $1;
@@ -87,7 +87,7 @@ while (<>) {
 		$count = $count + 1;
 	}
 
-	if ($line =~ /([0-9\.]+)\] initcall ([a-zA-Z0-9\_]+)\+.*returned/) {
+	if ($line =~ /([0-9\.]+)\] initcall ([a-zA-Z0-9\_\.]+)\+.*returned/) {
 		if ($done == 0) {
 			$end{$2} = $1;
 			$maxtime = $1;
_
