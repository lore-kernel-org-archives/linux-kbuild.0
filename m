Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35363 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab2LYXKd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Dec 2012 18:10:33 -0500
Received: by mail-wi0-f170.google.com with SMTP id hq7so3771866wib.3
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Dec 2012 15:10:32 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/1] kconfig:lxdialog: remove duplicate code
Date: Wed, 26 Dec 2012 00:10:24 +0100
Message-Id: <97c8392e4ab44e19954ce3d82cdd183759624984.1356476868.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1356476868.git.yann.morin.1998@free.fr>
References: <cover.1356476868.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1356476868.git.yann.morin.1998@free.fr>
References: <cover.1356476868.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Wang YanQing <udknight@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Wang YanQing <udknight@gmail.com>

dialog.h has two line the same below:
extern char dialog_input_result[];
This patch remove one of them.

Signed-off-by: Wang YanQing <udknight@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/lxdialog/dialog.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/lxdialog/dialog.h
index ee17a52..307022a 100644
--- a/scripts/kconfig/lxdialog/dialog.h
+++ b/scripts/kconfig/lxdialog/dialog.h
@@ -221,7 +221,6 @@ int dialog_menu(const char *title, const char *prompt,
 		const void *selected, int *s_scroll);
 int dialog_checklist(const char *title, const char *prompt, int height,
 		     int width, int list_height);
-extern char dialog_input_result[];
 int dialog_inputbox(const char *title, const char *prompt, int height,
 		    int width, const char *init);
 
-- 
1.7.2.5

