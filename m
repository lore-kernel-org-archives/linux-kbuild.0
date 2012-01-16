Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:51465 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752864Ab2APHzN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Jan 2012 02:55:13 -0500
Message-ID: <4F13D873.4070808@cn.fujitsu.com>
Date: Mon, 16 Jan 2012 15:57:39 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: [PATCH] menuconfig: fix a regression when canceling the prompt dialog
 at exit
References: <4F13CB49.8030004@cn.fujitsu.com> <1326698421.4151.4.camel@cr0> <4F13D216.3060705@cn.fujitsu.com>
In-Reply-To: <4F13D216.3060705@cn.fujitsu.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Cong Wang <amwang@redhat.com>, Arnaud Lacombe <lacombar@gmail.com>, Davidlohr Bueso <dave@gnu.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Wang YanQing <udknight@gmail.com>

This commit fixes a bug, while introducing a new one..

commit 7203ddbd4be9720649e47d756a001e0c7d7f8ae2
Author: Wang YanQing <udknight@gmail.com>
Date:   Thu Jan 12 11:31:32 2012 +0800

    menuconfig: let make not report error when not save configuration

Pressing ESC should cancel the yes/no dialog and return back to
the main menu, but not exit from menuconfig.

Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>
---
 scripts/kconfig/mconf.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 86cd1ea..2c6286c 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -830,7 +830,8 @@ static int handle_exit(void)
 		fprintf(stderr, _("\n\n"
 				  "Your configuration changes were NOT saved."
 				  "\n\n"));
-		res = 0;
+		if (res != KEY_ESC)
+			res = 0;
 	}
 
 	return res;
-- 
1.7.3.1
