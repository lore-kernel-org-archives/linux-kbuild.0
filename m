Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:40549 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751350Ab3KRVDW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Nov 2013 16:03:22 -0500
Received: by mail-wg0-f54.google.com with SMTP id y10so6665292wgg.21
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2013 13:03:21 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] kconfig: add comment about 'jump maybe used unitialized'
Date: Mon, 18 Nov 2013 22:03:15 +0100
Message-Id: <1384808595-26028-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Christian Kujau <lists@nerdbynature.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Benjamin Poirier <bpoirier@suse.de>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

On some distros shipping gcc 4.8.0 20130526 (as reported by Madhavan),
gcc incorrectly warns about 'jump may be used uninitialized'.

Given the current code path, this is not possible.

gcc 4.6.x, 4.7.x and 4.81+ do not emit this warning.

So, we consider this as a spurious error from the gcc 4.8.0 that is
shipped on a specific (unidentifed so far) distro.

But since two users have reported this issue, lets comment the 'jump'
declaration that it should *not* be initialised, since we will still
want to catch unitialised use in the future, should we were to change
the code.

Reported-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Reported-by: Christian Kujau <lists@nerdbynature.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Benjamin Poirier <bpoirier@suse.de>

---
All,

Here is the patch I'm queuing to 'solve' this issue.
I'll wait a bit for some feedback before I push it.

Madhavan, Christian, if you could give a bit ;ore details on the distro
you're using, that be nice so we can have a more descriptive commit log.

Regards,
Yann E. MORIN.

---
 scripts/kconfig/menu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index c1d5320..a7b0566 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -544,6 +544,13 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 {
 	int i, j;
 	struct menu *submenu[8], *menu, *location = NULL;
+	/* gcc 4.8.0 on (on some distros) warns about 'jump may be used
+	   uninitialized', which is wrong, given the current code-path.
+	   The warning does not appear with gcc != 4.8.0.
+	   If we were to change the code below, we would still want gcc to
+	   warn if jump is unitialised, so we explicitly do *not* initialise
+	   it here.
+	 */
 	struct jump_key *jump;
 
 	str_printf(r, _("Prompt: %s\n"), _(prop->text));
-- 
1.8.1.2

