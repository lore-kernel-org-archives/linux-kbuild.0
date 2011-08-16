Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:64716 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab1HPFYA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2011 01:24:00 -0400
Received: by yie30 with SMTP id 30so3593933yie.19
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Aug 2011 22:24:00 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 1/3] kconfig/streamline_config.pl: directly access LSMOD from the environment
Date: Tue, 16 Aug 2011 01:23:51 -0400
Message-Id: <1313472233-14094-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/Makefile             |   12 ++----------
 scripts/kconfig/streamline_config.pl |    8 ++++++--
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 82d2eb2..bd41ab2 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -33,17 +33,9 @@ silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/generated
 	$< --$@ $(Kconfig)
 
-# if no path is given, then use src directory to find file
-ifdef LSMOD
-LSMOD_F := $(LSMOD)
-ifeq ($(findstring /,$(LSMOD)),)
-  LSMOD_F := $(objtree)/$(LSMOD)
-endif
-endif
-
 localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 	$(Q)mkdir -p include/generated
-	$(Q)perl $< $(srctree) $(Kconfig) $(LSMOD_F) > .tmp.config
+	$(Q)perl $< $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
 			cmp -s .tmp.config .config ||			\
 			(mv -f .config .config.old.1;			\
@@ -58,7 +50,7 @@ localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 
 localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
 	$(Q)mkdir -p include/generated
-	$(Q)perl $< $(srctree) $(Kconfig) $(LSMOD_F) > .tmp.config
+	$(Q)perl $< $(srctree) $(Kconfig) > .tmp.config
 	$(Q)sed -i s/=m/=y/ .tmp.config
 	$(Q)if [ -f .config ]; then					\
 			cmp -s .tmp.config .config ||			\
diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index a4fe923..ae34d20 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -115,7 +115,7 @@ find_config;
 # Get the build source and top level Kconfig file (passed in)
 my $ksource = $ARGV[0];
 my $kconfig = $ARGV[1];
-my $lsmod_file = $ARGV[2];
+my $lsmod_file = $ENV{'LSMOD'};
 
 my @makefiles = `find $ksource -name Makefile 2>/dev/null`;
 chomp @makefiles;
@@ -296,7 +296,11 @@ my %modules;
 
 if (defined($lsmod_file)) {
     if ( ! -f $lsmod_file) {
-	die "$lsmod_file not found";
+	if ( -f $ENV{'objtree'}."/".$lsmod_file) {
+	    $lsmod_file = $ENV{'objtree'}."/".$lsmod_file;
+	} else {
+		die "$lsmod_file not found";
+	}
     }
     if ( -x $lsmod_file) {
 	# the file is executable, run it
-- 
1.7.6.153.g78432

