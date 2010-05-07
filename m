Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:54475 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752799Ab0EGFzc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 May 2010 01:55:32 -0400
Message-ID: <4BE3ABC2.4030507@cn.fujitsu.com>
Date: Fri, 07 May 2010 13:57:22 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/8] menuconfig: improive help text a bit
References: <4BE3AB91.80606@cn.fujitsu.com>
In-Reply-To: <4BE3AB91.80606@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Suggested-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>
Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 scripts/kconfig/mconf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 33f31eb..7ca6e8e 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -74,7 +74,7 @@ static const char mconf_readme[] = N_(
 "\n"
 "   Shortcut: Press <H> or <?>.\n"
 "\n"
-"o  To show hidden options, press <Z>.\n"
+"o  To toggle the display of hidden options, press <Z>.\n"
 "\n"
 "\n"
 "Radiolists  (Choice lists)\n"
-- 
1.6.3

