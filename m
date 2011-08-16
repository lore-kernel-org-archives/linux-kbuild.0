Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:46886 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647Ab1HPFYE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2011 01:24:04 -0400
Received: by yxj19 with SMTP id 19so3557331yxj.19
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Aug 2011 22:24:03 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 2/3] kconfig/streamline_config.pl: use options to determine operating mode
Date: Tue, 16 Aug 2011 01:23:52 -0400
Message-Id: <1313472233-14094-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1313472233-14094-1-git-send-email-lacombar@gmail.com>
References: <1313472233-14094-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

The options introduced are --localmodconfig (default) and --localyesconfig.
They match the Makefile target behavior.

Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/Makefile             |    4 ++--
 scripts/kconfig/streamline_config.pl |   14 +++++++++++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index bd41ab2..4de8973 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -35,7 +35,7 @@ silentoldconfig: $(obj)/conf
 
 localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 	$(Q)mkdir -p include/generated
-	$(Q)perl $< $(srctree) $(Kconfig) > .tmp.config
+	$(Q)perl $< --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
 			cmp -s .tmp.config .config ||			\
 			(mv -f .config .config.old.1;			\
@@ -50,7 +50,7 @@ localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 
 localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
 	$(Q)mkdir -p include/generated
-	$(Q)perl $< $(srctree) $(Kconfig) > .tmp.config
+	$(Q)perl $< --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)sed -i s/=m/=y/ .tmp.config
 	$(Q)if [ -f .config ]; then					\
 			cmp -s .tmp.config .config ||			\
diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index ae34d20..ec7afce 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -43,6 +43,7 @@
 #    make oldconfig
 #
 use strict;
+use Getopt::Long;
 
 my $config = ".config";
 
@@ -112,6 +113,13 @@ sub find_config {
 
 find_config;
 
+# Parse options
+my $localmodconfig = 0;
+my $localyesconfig = 0;
+
+GetOptions("localmodconfig" => \$localmodconfig,
+	   "localyesconfig" => \$localyesconfig);
+
 # Get the build source and top level Kconfig file (passed in)
 my $ksource = $ARGV[0];
 my $kconfig = $ARGV[1];
@@ -425,7 +433,11 @@ while(<CIN>) {
 
     if (/^(CONFIG.*)=(m|y)/) {
 	if (defined($configs{$1})) {
-	    $setconfigs{$1} = $2;
+	    if ($localyesconfig) {
+	        $setconfigs{$1} = 'y';
+	    } else {
+	        $setconfigs{$1} = $2;
+	    }
 	} elsif ($2 eq "m") {
 	    print "# $1 is not set\n";
 	    next;
-- 
1.7.6.153.g78432

