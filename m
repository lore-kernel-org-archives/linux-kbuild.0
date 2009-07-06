Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:42540 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754460AbZGFEHM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jul 2009 00:07:12 -0400
Received: by fxm18 with SMTP id 18so3686080fxm.37
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jul 2009 21:07:14 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Jul 2009 00:07:14 -0400
Message-ID: <1a69a9d80907052107w5a2b39b5m2eb4cba3d24318c3@mail.gmail.com>
Subject: [PATCH 1/2] Kconfig: variable argument lists needs `stdarg.h'
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>

Fix build on non GNU based platforms.
---
 scripts/kconfig/lxdialog/util.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index 86d95cc..f2375ad 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -19,6 +19,8 @@
  *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */

+#include <stdarg.h>
+
 #include "dialog.h"

 struct dialog_info dlg;
-- 
1.6.3.3.385.g60647.dirty
