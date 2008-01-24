Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37448 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758850AbYAXWDv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:51 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 02/77] kernel-doc: init kernel version
Date: Thu, 24 Jan 2008 23:02:43 +0100
Message-Id: <1201212238-4369-2-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Johannes Berg <johannes@sipsolutions.net>

The kernel-doc script triggers a perl warning when invoked
without KERNELVERSION in the environment, rather make it use
the string "unknown kernel version" instead.

Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kernel-doc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e4fa8d9..8cf528b 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -334,7 +334,7 @@ while ($ARGV[0] =~ m/^-(.*)/) {
 
 # get kernel version from env
 sub get_kernel_version() {
-    my $version;
+    my $version = 'unknown kernel version';
 
     if (defined($ENV{'KERNELVERSION'})) {
 	$version = $ENV{'KERNELVERSION'};
-- 
1.5.4.rc3.14.g44397

