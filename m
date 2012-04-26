Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out03.mta.xmission.com ([166.70.13.233]:60118 "EHLO
	out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755006Ab2DZIr3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Apr 2012 04:47:29 -0400
From: ebiederm@xmission.com (Eric W. Biederman)
References: <m1aa22rllb.fsf@fess.ebiederm.org> <4F96705C.5030901@suse.cz>
	<m1aa21nxzg.fsf_-_@fess.ebiederm.org>
	<20120424123305.GA30068@sepie.suse.cz>
	<m1k415mgrv.fsf@fess.ebiederm.org> <4F96AC7F.6080603@suse.cz>
Date: Thu, 26 Apr 2012 01:51:32 -0700
In-Reply-To: <4F96AC7F.6080603@suse.cz> (Michal Marek's message of "Tue, 24
	Apr 2012 15:37:03 +0200")
Message-ID: <m1wr52dgff.fsf@fess.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [PATCH] kbuild: Add error handling to KCONFIG_ALL_CONFIG
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org


- Only try to read the file specified if KCONFIG_ALL_CONFIG is set to
  something other than the empty string or "1".

- Don't use stat to check the name passed to conf_read_simple so that
  zconf_fopen can find the file in the current directory or in SRCTREE
  removing a extremely source of confusing failure, where KCONFIG_ALL_CONFIG
  was not interpreted with respect to the directory make was called in.

- If conf_read_simple fails complain clearly and stop processing.
  Allowing the simple debugging of typos.

- Clearly document the behavior so it is clear to users which
  values are treated as flags and which values are treated as
  filenames.

Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 Documentation/kbuild/kconfig.txt |   18 +++++++++---------
 scripts/kconfig/conf.c           |   20 ++++++++++++++------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index 9d5f2a9..a09f1a6 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -53,15 +53,15 @@ KCONFIG_ALLCONFIG
 --------------------------------------------------
 (partially based on lkml email from/by Rob Landley, re: miniconfig)
 --------------------------------------------------
-The allyesconfig/allmodconfig/allnoconfig/randconfig variants can
-also use the environment variable KCONFIG_ALLCONFIG as a flag or a
-filename that contains config symbols that the user requires to be
-set to a specific value.  If KCONFIG_ALLCONFIG is used without a
-filename, "make *config" checks for a file named
-"all{yes/mod/no/def/random}.config" (corresponding to the *config command
-that was used) for symbol values that are to be forced.  If this file
-is not found, it checks for a file named "all.config" to contain forced
-values.
+The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
+use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
+that contains config symbols that the user requires to be set to a
+specific value.  If KCONFIG_ALLCONFIG is used without a filename where
+KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", "make *config"
+checks for a file named "all{yes/mod/no/def/random}.config"
+(corresponding to the *config command that was used) for symbol values
+that are to be forced.  If this file is not found, it checks for a
+file named "all.config" to contain forced values.
 
 This enables you to create "miniature" config (miniconfig) or custom
 config files containing just the config symbols that you are interested
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index f208f90..0fdda91 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -574,8 +574,13 @@ int main(int ac, char **av)
 	case alldefconfig:
 	case randconfig:
 		name = getenv("KCONFIG_ALLCONFIG");
-		if (name && !stat(name, &tmpstat)) {
-			conf_read_simple(name, S_DEF_USER);
+		if (name && (strcmp(name, "") != 0) && (strcmp(name, "1") != 0)) {
+			if (conf_read_simple(name, S_DEF_USER)) {
+				fprintf(stderr,
+					_("*** Can't read seed configuration \"%s\"!\n"),
+					name);
+				exit(1);
+			}
 			break;
 		}
 		switch (input_mode) {
@@ -586,10 +591,13 @@ int main(int ac, char **av)
 		case randconfig:	name = "allrandom.config"; break;
 		default: break;
 		}
-		if (!stat(name, &tmpstat))
-			conf_read_simple(name, S_DEF_USER);
-		else if (!stat("all.config", &tmpstat))
-			conf_read_simple("all.config", S_DEF_USER);
+		if (conf_read_simple(name, S_DEF_USER) &&
+		    conf_read_simple("all.config", S_DEF_USER)) {
+			fprintf(stderr,
+				_("*** KCONFIG_ALLCONFIG set, but no \"%s\" or \"all.config\" file found\n"),
+				name);
+			exit(1);
+		}
 		break;
 	default:
 		break;
-- 
1.7.2.5

