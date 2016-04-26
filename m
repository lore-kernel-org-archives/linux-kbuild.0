Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34080 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752273AbcDZSwV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 14:52:21 -0400
From: Benjamin Poirier <bpoirier@suse.com>
Subject: [PATCH v2] localmodconfig: Reset certificate paths
Date: Tue, 26 Apr 2016 11:52:01 -0700
Message-Id: <1461696721-3001-1-git-send-email-bpoirier@suse.com>
In-Reply-To: <20160426185122.GA2979@f1.synalogic.ca>
References: <20160426185122.GA2979@f1.synalogic.ca>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When using `make localmodconfig` and friends, if the input config comes
from a kernel that was built in a different environment (for example, the
canonical case of using localmodconfig to trim a distribution kernel
config) the key files for module signature checking will not be available
and should be regenerated or omitted. Otherwise, the user will be faced
with annoying errors when trying to build with the generated .config:

make[1]: *** No rule to make target 'keyring.crt', needed by 'certs/x509_certificate_list'.  Stop.
Makefile:1576: recipe for target 'certs/' failed

Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
---
 scripts/kconfig/streamline_config.pl | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 01b53ec..95a6f2b 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
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
-- 
2.7.4

