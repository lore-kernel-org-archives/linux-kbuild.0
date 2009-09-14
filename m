Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:47852 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756509AbZINVtf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:35 -0400
Message-Id: <200909142149.n8ELn9r1018647@imap1.linux-foundation.org>
Subject: [patch 08/18] markup_oops: use modinfo to avoid confusion with underscored module names
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, ozan@pardus.org.tr, arjan@infradead.org, xiyou.wangcong@gmail.com

From: Ozan Çaglayan <ozan@pardus.org.tr>

When EIP is at a module having an underscore in its name, the current code
fails to find it because the module filenames has '-' instead of '_'.  Use
modinfo for a better path finding.

Signed-off-by: Ozan Çaglayan <ozan@pardus.org.tr>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
Cc: Arjan van de Ven <arjan@infradead.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/markup_oops.pl |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff -puN scripts/markup_oops.pl~markup_oops-use-modinfo-to-avoid-confusion-with-underscored-module-names scripts/markup_oops.pl
--- a/scripts/markup_oops.pl~markup_oops-use-modinfo-to-avoid-confusion-with-underscored-module-names
+++ a/scripts/markup_oops.pl
@@ -184,10 +184,7 @@ if ($target eq "0") {
 
 # if it's a module, we need to find the .ko file and calculate a load offset
 if ($module ne "") {
-	my $dir = dirname($filename);
-	$dir = $dir . "/";
-	my $mod = $module . ".ko";
-	my $modulefile = `find $dir -name $mod | head -1`;
+	my $modulefile = `modinfo $module | grep '^filename:' | awk '{ print \$2 }'`;
 	chomp($modulefile);
 	$filename = $modulefile;
 	if ($filename eq "") {
_
