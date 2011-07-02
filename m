Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35815 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936Ab1GBFKy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Jul 2011 01:10:54 -0400
Received: by mail-iw0-f174.google.com with SMTP id 6so3288158iwn.19
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2011 22:10:54 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 5/5] kconfig/conf: mark xfgets() private
Date: Sat,  2 Jul 2011 01:10:40 -0400
Message-Id: <1309583440-4795-6-git-send-email-lacombar@gmail.com>
In-Reply-To: <1309583440-4795-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
 <1309583440-4795-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>

This function has not much reason to be public. In the mean time, convert
declaration from K&R C to ISO C.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c |    7 +++----
 scripts/kconfig/lkc.h  |    3 ---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 819ab18..f208f90 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -18,6 +18,7 @@
 
 static void conf(struct menu *menu);
 static void check_conf(struct menu *menu);
+static void xfgets(char *str, int size, FILE *in);
 
 enum input_mode {
 	oldaskconfig,
@@ -672,13 +673,11 @@ int main(int ac, char **av)
 	}
 	return 0;
 }
+
 /*
  * Helper function to facilitate fgets() by Jean Sacren.
  */
-void xfgets(str, size, in)
-	char *str;
-	int size;
-	FILE *in;
+void xfgets(char *str, int size, FILE *in)
 {
 	if (fgets(str, size, in) == NULL)
 		fprintf(stderr, "\nError in reading or end of file.\n");
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 60ffe8c..eed2249 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -76,9 +76,6 @@ void zconf_nextfile(const char *name);
 int zconf_lineno(void);
 const char *zconf_curname(void);
 
-/* conf.c */
-void xfgets(char *str, int size, FILE *in);
-
 /* confdata.c */
 const char *conf_get_configname(void);
 const char *conf_get_autoconfig_name(void);
-- 
1.7.3.4.574.g608b.dirty

