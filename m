Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43387 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750978AbcDBRzj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Apr 2016 13:55:39 -0400
From: Benjamin Poirier <bpoirier@suse.com>
Subject: [PATCH 1/2] localmodconfig: Fix parsing of Kconfig "source" statements
Date: Sat,  2 Apr 2016 10:55:21 -0700
Message-Id: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The parameter of Kconfig "source" statements does not need to be quoted.
The current regex causes many kconfig files to be skipped and hence,
dependencies to be missed.

Also fix the whitespace repeat count.

Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index f3d3fb4..7036ae3 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -188,7 +188,7 @@ sub read_kconfig {
 	$cont = 0;
 
 	# collect any Kconfig sources
-	if (/^source\s*"(.*)"/) {
+	if (/^source\s+"?([^"]+)/) {
 	    my $kconfig = $1;
 	    # prevent reading twice.
 	    if (!defined($read_kconfigs{$kconfig})) {
-- 
2.7.2

