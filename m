Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56492 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754093Ab1DEO7g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 10:59:36 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 20/34] parport: Drop __TIME__ usage
Date: Tue,  5 Apr 2011 16:59:07 +0200
Message-Id: <1302015561-21047-21-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnaud Giersch <arnaud.giersch@free.fr>

The kernel already prints its build timestamp during boot, no need to
repeat it in random drivers and produce different object files each
time.

Cc: Arnaud Giersch <arnaud.giersch@free.fr>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/parport/parport_ip32.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/parport/parport_ip32.c b/drivers/parport/parport_ip32.c
index d3d7809..0dc34f1 100644
--- a/drivers/parport/parport_ip32.c
+++ b/drivers/parport/parport_ip32.c
@@ -2203,7 +2203,6 @@ static __exit void parport_ip32_unregister_port(struct parport *p)
 static int __init parport_ip32_init(void)
 {
 	pr_info(PPIP32 "SGI IP32 built-in parallel port driver v0.6\n");
-	pr_debug1(PPIP32 "Compiled on %s, %s\n", __DATE__, __TIME__);
 	this_port = parport_ip32_probe_port();
 	return IS_ERR(this_port) ? PTR_ERR(this_port) : 0;
 }
-- 
1.7.4.1

