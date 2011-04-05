Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44437 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754069Ab1DEO7f (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 10:59:35 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 09/34] x86: Allow to override the ROOT_DEV variable
Date: Tue,  5 Apr 2011 16:58:56 +0200
Message-Id: <1302015561-21047-10-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 arch/x86/boot/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index f7cb086..7a70c60 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -13,7 +13,7 @@
 # This can be either FLOPPY, CURRENT, /dev/xxxx or empty, in which case
 # the default of FLOPPY is used by 'build'.
 
-ROOT_DEV	:= CURRENT
+ROOT_DEV	?= CURRENT
 
 # If you want to preset the SVGA mode, uncomment the next line and
 # set SVGA_MODE to whatever number you want.
-- 
1.7.4.1

