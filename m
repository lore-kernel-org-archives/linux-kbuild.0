Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50820 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751474AbbKZPgr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Nov 2015 10:36:47 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH] ath10: Fix build with CONFIG_THERMAL=m
Date: Thu, 26 Nov 2015 16:36:38 +0100
Message-Id: <1448552198-26911-1-git-send-email-mmarek@suse.com>
In-Reply-To: <201511260039.iQbaOe1h%fengguang.wu@intel.com>
References: <201511260039.iQbaOe1h%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: kbuild-all@01.org, fengguang.wu@intel.com, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

After commit cf4f21938e13 ("kbuild: Allow to specify composite modules
with modname-m"), thermal.c gets included in the driver and the build
fails with

drivers/net/wireless/ath/ath10k/thermal.c:119:6: error: redefinition of ‘ath10k_thermal_event_temperature’
drivers/net/wireless/ath/ath10k/thermal.h:54:20: note: previous definition of ‘ath10k_thermal_event_temperature’ was here
drivers/net/wireless/ath/ath10k/thermal.c:136:6: error: redefinition of ‘ath10k_thermal_set_throttling’
drivers/net/wireless/ath/ath10k/thermal.h:59:20: note: previous definition of ‘ath10k_thermal_set_throttling’ was here
drivers/net/wireless/ath/ath10k/thermal.c:162:5: error: redefinition of ‘ath10k_thermal_register’
drivers/net/wireless/ath/ath10k/thermal.h:45:19: note: previous definition of ‘ath10k_thermal_register’ was here
drivers/net/wireless/ath/ath10k/thermal.c:216:6: error: redefinition of ‘ath10k_thermal_unregister’
drivers/net/wireless/ath/ath10k/thermal.h:50:20: note: previous definition of ‘ath10k_thermal_unregister’ was here

Change the #ifdef to reflect the new kbuild behavior.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 drivers/net/wireless/ath/ath10k/thermal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wireless/ath/ath10k/thermal.h
index b610ea5caae8..c9223e9e962f 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.h
+++ b/drivers/net/wireless/ath/ath10k/thermal.h
@@ -36,7 +36,7 @@ struct ath10k_thermal {
 	int temperature;
 };
 
-#ifdef CONFIG_THERMAL
+#if IS_REACHABLE(CONFIG_THERMAL)
 int ath10k_thermal_register(struct ath10k *ar);
 void ath10k_thermal_unregister(struct ath10k *ar);
 void ath10k_thermal_event_temperature(struct ath10k *ar, int temperature);
-- 
2.1.4

