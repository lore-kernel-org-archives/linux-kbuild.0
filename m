Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:34286 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757337Ab0BCPtJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Feb 2010 10:49:09 -0500
Message-Id: <20100203154906.255551521@goodmis.org>
Date: Wed, 03 Feb 2010 10:46:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 3/4] kconfig: Look in both /bin and /sbin for lsmod in streamline_config.pl
References: <20100203154605.461025238@goodmis.org>
Content-Disposition: inline; filename=0003-kconfig-Look-in-both-bin-and-sbin-for-lsmod-in-strea.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Anibal Monsalve Salazar <anibal@debian.org>, Michal Marek <mmarek@suse.cz>, Xavier Chantry <shiningxc@gmail.com>

From: Steven Rostedt <srostedt@redhat.com>

Distributions now have lsmod in /bin instead of /sbin. But to handle
both cases, we look for it in /sbin /bin /usr/bin and /usr/sbin.
If lsmod is not found in any of those paths, it defaults to use
just lsmod and hopes that it lies in the path of the user.

Tested-by: Xavier Chantry <shiningxc@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 9e66fa8..d7f7db7 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -264,7 +264,20 @@ foreach my $makefile (@makefiles) {
 my %modules;
 
 # see what modules are loaded on this system
-open(LIN,"/sbin/lsmod|") || die "Cant lsmod";
+my $lsmod;
+
+foreach $dir ( ("/sbin", "/bin", "/usr/sbin", "/usr/bin") ) {
+    if ( -x "$dir/lsmod" ) {
+	$lsmod = "$dir/lsmod";
+	last;
+    }
+}
+if (!defined($lsmod)) {
+    # try just the path
+    $lsmod = "lsmod";
+}
+
+open(LIN,"$lsmod|") || die "Can not call lsmod with $lsmod";
 while (<LIN>) {
 	next if (/^Module/);  # Skip the first line.
 	if (/^(\S+)/) {
-- 
1.6.5


