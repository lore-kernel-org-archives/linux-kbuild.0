Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:55019 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932299Ab3BIA6R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Feb 2013 19:58:17 -0500
Received: by mail-wi0-f178.google.com with SMTP id o1so1480362wic.5
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Feb 2013 16:58:16 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/2] kconfig: nconf: rewrite labels of function keys line
Date: Sat,  9 Feb 2013 01:58:07 +0100
Message-Id: <2c68115cb3d2863004f1dd5c01e3adbd54facd4c.1360371247.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1360371247.git.yann.morin.1998@free.fr>
References: <cover.1360371247.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1360371247.git.yann.morin.1998@free.fr>
References: <cover.1360371247.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Roland Eggner <edvx1@systemanalysen.net>, Dmitry Voytik <dvv.kernel@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Roland Eggner <edvx1@systemanalysen.net>

>From: Roland Eggner <edvx1@systemanalysen.net>

More reasonable labels of function keys line.  Rename labels and keep menu
width, as required for fitting on COLUMNS=80 terminals:
•  s/Insts/Help 2/
•  s/Config/ShowAll/

Signed-off-by: Roland Eggner <edvx1@systemanalysen.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/nconf.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 65c672c..dbf31ed 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -312,19 +312,19 @@ struct function_keys function_keys[] = {
 	},
 	{
 		.key_str = "F2",
-		.func = "Sym Info",
+		.func = "SymInfo",
 		.key = F_SYMBOL,
 		.handler = handle_f2,
 	},
 	{
 		.key_str = "F3",
-		.func = "Insts",
+		.func = "Help 2",
 		.key = F_INSTS,
 		.handler = handle_f3,
 	},
 	{
 		.key_str = "F4",
-		.func = "Config",
+		.func = "ShowAll",
 		.key = F_CONF,
 		.handler = handle_f4,
 	},
@@ -348,7 +348,7 @@ struct function_keys function_keys[] = {
 	},
 	{
 		.key_str = "F8",
-		.func = "Sym Search",
+		.func = "SymSearch",
 		.key = F_SEARCH,
 		.handler = handle_f8,
 	},
-- 
1.7.2.5

