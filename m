Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta10.emeryville.ca.mail.comcast.net ([76.96.30.17]:59551 "EHLO
	qmta10.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753923Ab1ANONV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:13:21 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 04/27] h8300: change to new flag variable
Date: Fri, 14 Jan 2011 06:12:27 -0800
Message-Id: <1cc51dab661228edea451efaa7caef74d27415c7.1295006565.git.mfm@muteddisk.com>
In-Reply-To: <cover.1295006561.git.mfm@muteddisk.com>
References: <cover.1295006561.git.mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Replace EXTRA_AFLAGS with asflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
---
 arch/h8300/boot/compressed/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/h8300/boot/compressed/Makefile b/arch/h8300/boot/compressed/Makefile
index d6189e0..6745cb1 100644
--- a/arch/h8300/boot/compressed/Makefile
+++ b/arch/h8300/boot/compressed/Makefile
@@ -5,7 +5,7 @@
 #
 
 targets		:= vmlinux vmlinux.bin vmlinux.bin.gz head.o misc.o piggy.o
-EXTRA_AFLAGS	:= -traditional
+asflags-y	:= -traditional
 
 OBJECTS = $(obj)/head.o $(obj)/misc.o
 
-- 
1.7.3.4

