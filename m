Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:62268 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755310Ab1EPDXJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 May 2011 23:23:09 -0400
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: do not record timestamp in .config
Date: Sun, 15 May 2011 23:22:56 -0400
Message-Id: <1305516176-4072-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

The following patch removes the timestamp in .config file. This is a
prerequiresite for the revised version of the printer merge I sent back
in December[0]. The issue is that heading comment generations will be
merged in a single function, and that would revert the deterministic
change you made in mid-April.

The other options are either to have timestamp always enabled and
disable them selectively, but that might be a pain to implement, or to
have timestamp disable by default and an environment variable, say
KCONFIG_TIMESTAMP, to turn everything on manually.

Regards,
 - Arnaud

[0]: https://patchwork.kernel.org/patch/380631/

--

From: Arnaud Lacombe <lacombar@gmail.com>
Subject: kconfig: do not record timestamp in .config

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 Documentation/kbuild/kconfig.txt |    5 -----
 scripts/kconfig/confdata.c       |   12 +-----------
 2 files changed, 1 insertions(+), 16 deletions(-)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index cca46b1..c313d71 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -48,11 +48,6 @@ KCONFIG_OVERWRITECONFIG
 If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
 break symlinks when .config is a symlink to somewhere else.
 
-KCONFIG_NOTIMESTAMP
---------------------------------------------------
-If this environment variable exists and is non-null, the timestamp line
-in generated .config files is omitted.
-
 ______________________________________________________________________
 Environment variables for '{allyes/allmod/allno/rand}config'
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 834eecb..2bafd9a 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -560,8 +560,6 @@ int conf_write(const char *name)
 	const char *basename;
 	const char *str;
 	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
-	time_t now;
-	int use_timestamp = 1;
 	char *env;
 
 	dirname[0] = 0;
@@ -598,19 +596,11 @@ int conf_write(const char *name)
 	if (!out)
 		return 1;
 
-	time(&now);
-	env = getenv("KCONFIG_NOTIMESTAMP");
-	if (env && *env)
-		use_timestamp = 0;
-
 	fprintf(out, _("#\n"
 		       "# Automatically generated make config: don't edit\n"
 		       "# %s\n"
-		       "%s%s"
 		       "#\n"),
-		     rootmenu.prompt->text,
-		     use_timestamp ? "# " : "",
-		     use_timestamp ? ctime(&now) : "");
+		     rootmenu.prompt->text);
 
 	if (!conf_get_changed())
 		sym_clear_all_valid();
-- 
1.7.3.4.574.g608b.dirty

