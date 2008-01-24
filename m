Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37450 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758859AbYAXWDv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:51 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 16/77] kbuild: fix a buffer overflow in modpost
Date: Thu, 24 Jan 2008 23:02:57 +0100
Message-Id: <1201212238-4369-16-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <ak@suse.de>, Sam Ravnborg <sam@ravnborg.org>

From: Andi Kleen <ak@suse.de>

When passing an file name > 1k the stack could be overflowed.
Not really a security issue, but still better plugged.
Signed-off-by: Andi Kleen <ak@suse.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 404ee0d..4d1c590 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1656,7 +1656,6 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	struct buffer buf = { };
-	char fname[SZ];
 	char *kernel_read = NULL, *module_read = NULL;
 	char *dump_write = NULL;
 	int opt;
@@ -1709,6 +1708,8 @@ int main(int argc, char **argv)
 	err = 0;
 
 	for (mod = modules; mod; mod = mod->next) {
+		char fname[strlen(mod->name) + 10];
+
 		if (mod->skip)
 			continue;
 
-- 
1.5.4.rc3.14.g44397

