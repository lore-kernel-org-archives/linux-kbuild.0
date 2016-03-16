Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:50799 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S966245AbcCPKxo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 06:53:44 -0400
From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH 2/2] kconfig: add unexpected data itself to warning
Date: Wed, 16 Mar 2016 11:53:39 +0100
Message-Id: <1458125619-28093-2-git-send-email-pebolle@tiscali.nl>
In-Reply-To: <1458125619-28093-1-git-send-email-pebolle@tiscali.nl>
References: <1458125619-28093-1-git-send-email-pebolle@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

If the .config parser runs into unexpected data it emits a warnings like
    .config:6911:warning: unexpected data

Add the unexpected data itself to the warning too, to make it easier to
discover what is going wrong:
     .config:6911:warning: unexpected data: CONFOG_CHARGER_TPS65217=m

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
 scripts/kconfig/confdata.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 51904c423411..62df2594bc24 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -398,8 +398,12 @@ load:
 			if (conf_set_sym_val(sym, def, def_flags, p))
 				continue;
 		} else {
-			if (line[0] != '\r' && line[0] != '\n')
-				conf_warning("unexpected data");
+			if (line[0] != '\r' && line[0] != '\n') {
+				char *tmp = chomp(line);
+
+				conf_warning("unexpected data: %s", tmp);
+				free(tmp);
+			}
 			continue;
 		}
 setsym:
-- 
2.4.3

