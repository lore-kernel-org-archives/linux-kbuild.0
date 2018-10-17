Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60778 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727678AbeJRBCl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 21:02:41 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/3] x86/mcelog: Remove one mce_helper definition
Date: Wed, 17 Oct 2018 19:05:53 +0200
Message-Id: <20181017170554.18841-3-bigeasy@linutronix.de>
In-Reply-To: <20181017170554.18841-1-bigeasy@linutronix.de>
References: <20181017170554.18841-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, linux-kbuild@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@suse.de>, linux-edac <linux-edac@vger.kernel.org>, x86@kernel.org

Commit 5de97c9f6d85f ("x86/mce: Factor out and deprecate the /dev/mcelog
driver") moved the old interface into one file including mce_helper
definition as static and "extern".

Cc: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@suse.de>
Cc: linux-edac <linux-edac@vger.kernel.org>
Cc: x86@kernel.org
Fixes:  5de97c9f6d85f ("x86/mce: Factor out and deprecate the /dev/mcelog driver")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/kernel/cpu/mcheck/dev-mcelog.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mcheck/dev-mcelog.c b/arch/x86/kernel/cpu/mcheck/dev-mcelog.c
index 97685a0c31751..27f394ac983f6 100644
--- a/arch/x86/kernel/cpu/mcheck/dev-mcelog.c
+++ b/arch/x86/kernel/cpu/mcheck/dev-mcelog.c
@@ -38,9 +38,6 @@ static struct mce_log_buffer mcelog = {
 
 static DECLARE_WAIT_QUEUE_HEAD(mce_chrdev_wait);
 
-/* User mode helper program triggered by machine check event */
-extern char			mce_helper[128];
-
 static int dev_mce_log(struct notifier_block *nb, unsigned long val,
 				void *data)
 {
-- 
2.19.1
