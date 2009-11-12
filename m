Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nwd2mail11.analog.com ([137.71.25.57]:4664 "EHLO
	nwd2mail11.analog.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbZKLJ7n (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Nov 2009 04:59:43 -0500
From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH v2] add userspace API headfile for net hardware time-stamp to kbuild
Date: Thu, 12 Nov 2009 17:59:56 +0800
Message-ID: <1258019996-8880-1-git-send-email-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org, Jie Zhang <jie.zhang@analog.com>, Barry Song <barry.song@analog.com>, Patrick Ohly <patrick.ohly@gmx.de>

From: Jie Zhang <jie.zhang@analog.com>

include/linux/net_tstamp.h is userspace API for hardware time stamping
of network packets. It should be exported to userspace.

Signed-off-by: Jie Zhang <jie.zhang@analog.com>
Signed-off-by: Barry Song <barry.song@analog.com>
cc: Patrick Ohly <patrick.ohly@gmx.de>
---
 -v2 cc to the right man

 include/linux/Kbuild |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/Kbuild b/include/linux/Kbuild
index 1feed71..f7508b0 100644
--- a/include/linux/Kbuild
+++ b/include/linux/Kbuild
@@ -118,6 +118,7 @@ header-y += mtio.h
 header-y += ncp_no.h
 header-y += neighbour.h
 header-y += net_dropmon.h
+header-y += net_tstamp.h
 header-y += netfilter_arp.h
 header-y += netrom.h
 header-y += nfs2.h
-- 
1.5.6.3

