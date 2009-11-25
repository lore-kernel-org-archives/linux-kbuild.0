Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:49419 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934382AbZKYEsl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 23:48:41 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] kconfig: display an error message when aborting
Date: Tue, 24 Nov 2009 23:48:42 -0500
Message-Id: <1259124522-26050-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org

If the Kconfig option causes an open() failure (like one that starts with
an underscore), there should be an error message shown since we're going
to be exiting with an error code.  Otherwise, the reason for the failure
can really only be diagnosed with strace or something similar.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 scripts/kconfig/confdata.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index b55e72f..e2644b4 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -640,6 +640,8 @@ static int conf_split_config(void)
 		fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
 		if (fd == -1) {
 			if (errno != ENOENT) {
+				conf_warning("sym '%s' with path '%s': %s",
+					     sym->name, path, strerror(errno));
 				res = 1;
 				break;
 			}
-- 
1.6.5.3

