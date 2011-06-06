Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34179 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756672Ab1FFS6p (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jun 2011 14:58:45 -0400
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 2/9] kconfig: fix return code for invalid boolean symbol in conf_set_sym_val()
Date: Mon,  6 Jun 2011 14:58:24 -0400
Message-Id: <1307386711-8866-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 3693ac7..a9f0ebd 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -141,7 +141,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			break;
 		}
 		conf_warning("symbol value '%s' invalid for %s", p, sym->name);
-		break;
+		return 1;
 	case S_OTHER:
 		if (*p != '"') {
 			for (p2 = p; *p2 && !isspace(*p2); p2++)
-- 
1.7.3.4.574.g608b.dirty

