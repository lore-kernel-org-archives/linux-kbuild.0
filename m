Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36572 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S936026AbYEBUso (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 16:48:44 -0400
From: sam@ravnborg.org
Subject: [PATCH] kconfig: .gitignore aconf
Date: Fri,  2 May 2008 22:49:17 +0200
Message-Id: <1209761358-6579-4-git-send-email-sam@ravnborg.org>
In-Reply-To: <1209761358-6579-3-git-send-email-sam@ravnborg.org>
References: <20080502204729.GA6534@uranus.ravnborg.org>
 <1209761358-6579-1-git-send-email-sam@ravnborg.org>
 <1209761358-6579-2-git-send-email-sam@ravnborg.org>
 <1209761358-6579-3-git-send-email-sam@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@uranus.ravnborg.org>

From: Sam Ravnborg <sam@uranus.ravnborg.org>

---
 scripts/kconfig/.gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index b49584c..ae664f9 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -13,6 +13,7 @@ lkc_defs.h
 # configuration programs
 #
 conf
+aconf
 mconf
 qconf
 gconf
-- 
1.5.4.1.143.ge7e51

