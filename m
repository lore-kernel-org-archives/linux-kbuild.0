Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:47154 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S967119AbcCPU1b (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 16:27:31 -0400
From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH v2] kconfig: add unexpected data itself to warning
Date: Wed, 16 Mar 2016 21:27:27 +0100
Message-Id: <1458160047-8292-1-git-send-email-pebolle@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

If the .config parser runs into unexpected data it emits warnings like:
    .config:6911:warning: unexpected data

Add the unexpected data itself to this warning. That makes it easier to
discover what is actually going wrong:
     .config:6911:warning: unexpected data: CONFOG_CHARGER_TPS65217=m

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
This v2 uses strcspn, as Michal suggesed. That turns a two patch series into a
more elegant oneliner. It apparently pays off to know what string.h has to
offer!

 scripts/kconfig/confdata.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0b7dc2fd7bac..6e22176cd6d6 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -377,7 +377,9 @@ load:
 				continue;
 		} else {
 			if (line[0] != '\r' && line[0] != '\n')
-				conf_warning("unexpected data");
+				conf_warning("unexpected data: %.*s",
+					     (int)strcspn(line, "\r\n"), line);
+
 			continue;
 		}
 setsym:
-- 
2.4.3

