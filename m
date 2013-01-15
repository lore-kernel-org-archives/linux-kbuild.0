Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:38641 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934144Ab3AOXNM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Jan 2013 18:13:12 -0500
Received: by mail-pb0-f54.google.com with SMTP id wz12so338103pbc.41
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Jan 2013 15:13:11 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 3/3] nconf: function keys line, change background color for better readability
Date: Wed, 16 Jan 2013 00:12:55 +0100
Message-Id: <265337184e10a1235ba90cfe5d357be79b5bf7a5.1358291451.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1358291451.git.yann.morin.1998@free.fr>
References: <cover.1358291451.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1358291451.git.yann.morin.1998@free.fr>
References: <cover.1358291451.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Roland Eggner <edvx1@systemanalysen.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Roland Eggner <edvx1@systemanalysen.net>

>From: Roland Eggner <edvx1@systemanalysen.net>

•  In function keys line descriptions black on darkblue are almost impossible
   to read.  Change colors to black on brown.

Signed-off-by: Roland Eggner <edvx1@systemanalysen.net>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/nconf.gui.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 379003c..9f8c44e 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -48,7 +48,7 @@ static void set_normal_colors(void)
 	init_pair(INPUT_FIELD, -1, -1);
 
 	init_pair(FUNCTION_HIGHLIGHT, -1, -1);
-	init_pair(FUNCTION_TEXT, COLOR_BLUE, -1);
+	init_pair(FUNCTION_TEXT, COLOR_YELLOW, -1);
 }
 
 /* available attributes:
-- 
1.7.2.5

