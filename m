Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:36832 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPxv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:53:51 -0400
Received: by gxk23 with SMTP id 23so1555729gxk.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:53:50 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 01/15] kconfig: replace a `switch()' statement by a more flexible `if()' statement
Date: Sat, 11 Sep 2010 11:51:08 -0400
Message-Id: <1284220282-3500-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

With the upcoming dynamical configuration prefix, we can no longer assume that
the prefix will start by a 'C'. As such, we can no longer hardcode this value in
the `case ...:', so replace the `switch() { ... }' statement by a more flexible
'if () { ... }' statement.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |   19 +++++--------------
 1 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index dc11d51..d9181de 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -221,8 +221,7 @@ load:
 	while (fgets(line, sizeof(line), in)) {
 		conf_lineno++;
 		sym = NULL;
-		switch (line[0]) {
-		case '#':
+		if (line[0] == '#') {
 			if (memcmp(line + 2, "CONFIG_", 7))
 				continue;
 			p = strchr(line + 9, ' ');
@@ -254,12 +253,7 @@ load:
 			default:
 				;
 			}
-			break;
-		case 'C':
-			if (memcmp(line, "CONFIG_", 7)) {
-				conf_warning("unexpected data");
-				continue;
-			}
+		} else if (memcmp(line, "CONFIG_", 7) == 0) {
 			p = strchr(line + 7, '=');
 			if (!p)
 				continue;
@@ -286,12 +280,9 @@ load:
 			}
 			if (conf_set_sym_val(sym, def, def_flags, p))
 				continue;
-			break;
-		case '\r':
-		case '\n':
-			break;
-		default:
-			conf_warning("unexpected data");
+		} else {
+			if (line[0] != '\r' && line[0] != '\n')
+				conf_warning("unexpected data");
 			continue;
 		}
 		if (sym && sym_is_choice_value(sym)) {
-- 
1.7.2.30.gc37d7.dirty

