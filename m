Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0113.hostedemail.com ([216.40.44.113]:33390 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751646AbcESSBe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 May 2016 14:01:34 -0400
Date: Thu, 19 May 2016 14:01:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [GIT PULL] localmodconfig: Updates and clean ups for
 streamline-config.pl
Message-ID: <20160519140130.5a937405@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Benjamin Poirier <bpoirier@suse.com>, linux-kbuild@vger.kernel.org


Linus,

Benjamin Poirier added some minor fixes and clean ups to localmodconfig.
One is a fix for making sure that module signing still works when
coming from a different environment. If original keys are not found, it
will warn and reset the keys to their default value.


Please pull the latest localmodconfig-v4.7 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
localmodconfig-v4.7

Tag SHA1: 0f4f7ec8af1f13ea3ab18c9e8acbcb742978b03e
Head SHA1: 5bcba792bb304e8341217d759ec486969a3b4258


Benjamin Poirier (6):
      localmodconfig: Fix parsing of Kconfig "source" statements
      localmodconfig: Recognize more keywords that end a menu entry
      localmodconfig: Fix parsing of "help" text
      localmodconfig: Add missing $ to reference a variable
      localmodconfig: Reset certificate paths
      localmodconfig: Fix whitespace repeat count after "tristate"

----
 scripts/kconfig/streamline_config.pl | 44 ++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)
---------------------------
diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index f3d3fb42b873..b8c7b29affc5 100755
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
@@ -237,7 +237,7 @@ sub read_kconfig {
 	    }
 
 	# configs without prompts must be selected
-	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
+	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
 	    # note if the config has a prompt
 	    $prompts{$config} = 1;
 
@@ -256,8 +256,8 @@ sub read_kconfig {
 
 	    $iflevel-- if ($iflevel);
 
-	# stop on "help"
-	} elsif (/^\s*help\s*$/) {
+	# stop on "help" and keywords that end a menu entry
+	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|choice|menu)\b/) {
 	    $state = "NONE";
 	}
     }
@@ -454,7 +454,7 @@ sub parse_config_depends
 	    $p =~ s/^[^$valid]*[$valid]+//;
 
 	    # We only need to process if the depend config is a module
-	    if (!defined($orig_configs{$conf}) || !$orig_configs{conf} eq "m") {
+	    if (!defined($orig_configs{$conf}) || $orig_configs{$conf} eq "y") {
 		next;
 	    }
 
@@ -610,6 +610,40 @@ foreach my $line (@config_file) {
 	next;
     }
 
+    if (/CONFIG_MODULE_SIG_KEY="(.+)"/) {
+        my $orig_cert = $1;
+        my $default_cert = "certs/signing_key.pem";
+
+        # Check that the logic in this script still matches the one in Kconfig
+        if (!defined($depends{"MODULE_SIG_KEY"}) ||
+            $depends{"MODULE_SIG_KEY"} !~ /"\Q$default_cert\E"/) {
+            print STDERR "WARNING: MODULE_SIG_KEY assertion failure, ",
+                "update needed to ", __FILE__, " line ", __LINE__, "\n";
+            print;
+        } elsif ($orig_cert ne $default_cert && ! -f $orig_cert) {
+            print STDERR "Module signature verification enabled but ",
+                "module signing key \"$orig_cert\" not found. Resetting ",
+                "signing key to default value.\n";
+            print "CONFIG_MODULE_SIG_KEY=\"$default_cert\"\n";
+        } else {
+            print;
+        }
+        next;
+    }
+
+    if (/CONFIG_SYSTEM_TRUSTED_KEYS="(.+)"/) {
+        my $orig_keys = $1;
+
+        if (! -f $orig_keys) {
+            print STDERR "System keyring enabled but keys \"$orig_keys\" ",
+                "not found. Resetting keys to default value.\n";
+            print "CONFIG_SYSTEM_TRUSTED_KEYS=\"\"\n";
+        } else {
+            print;
+        }
+        next;
+    }
+
     if (/^(CONFIG.*)=(m|y)/) {
 	if (defined($configs{$1})) {
 	    if ($localyesconfig) {
