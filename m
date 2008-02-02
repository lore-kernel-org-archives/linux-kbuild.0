Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52594 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763610AbYBBUqk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:40 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 8BEACE30A71
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Feb 2008 21:46:39 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] kconfig: mark config as changed when loading an alternate config
Date: Sat,  2 Feb 2008 21:46:38 +0100
Message-Id: <1201985204-26589-4-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>

Michal Zachar <mgzachar@mail.t-com.sk> reported that
menuconfig did not save the new config when loading
an alternate config unless he altered it manually.

Mark config as changed upon load of alternate config fixed this.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/mconf.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 50e61c4..734cf4f 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -821,6 +821,7 @@ static void conf_load(void)
 				return;
 			if (!conf_read(dialog_input_result)) {
 				set_config_filename(dialog_input_result);
+				sym_set_change_count(1);
 				return;
 			}
 			show_textbox(NULL, _("File does not exist!"), 5, 38);
-- 
1.5.4.rc3.14.g44397

