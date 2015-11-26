Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51981 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751065AbbKZPxd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Nov 2015 10:53:33 -0500
Subject: Re: [PATCH] ath10: Fix build with CONFIG_THERMAL=m
References: <201511260039.iQbaOe1h%fengguang.wu@intel.com>
 <1448552198-26911-1-git-send-email-mmarek@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56572AFB.20309@suse.cz>
Date: Thu, 26 Nov 2015 16:53:31 +0100
MIME-Version: 1.0
In-Reply-To: <1448552198-26911-1-git-send-email-mmarek@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-kbuild@vger.kernel.org, kbuild-all@01.org, fengguang.wu@intel.com, ath10k@lists.infradead.org

On 2015-11-26 16:36, Michal Marek wrote:
> After commit cf4f21938e13 ("kbuild: Allow to specify composite modules
> with modname-m"), thermal.c gets included in the driver and the build
> fails with
> 
> drivers/net/wireless/ath/ath10k/thermal.c:119:6: error: redefinition of ‘ath10k_thermal_event_temperature’
> drivers/net/wireless/ath/ath10k/thermal.h:54:20: note: previous definition of ‘ath10k_thermal_event_temperature’ was here
> drivers/net/wireless/ath/ath10k/thermal.c:136:6: error: redefinition of ‘ath10k_thermal_set_throttling’
> drivers/net/wireless/ath/ath10k/thermal.h:59:20: note: previous definition of ‘ath10k_thermal_set_throttling’ was here
> drivers/net/wireless/ath/ath10k/thermal.c:162:5: error: redefinition of ‘ath10k_thermal_register’
> drivers/net/wireless/ath/ath10k/thermal.h:45:19: note: previous definition of ‘ath10k_thermal_register’ was here
> drivers/net/wireless/ath/ath10k/thermal.c:216:6: error: redefinition of ‘ath10k_thermal_unregister’
> drivers/net/wireless/ath/ath10k/thermal.h:50:20: note: previous definition of ‘ath10k_thermal_unregister’ was here
> 
> Change the #ifdef to reflect the new kbuild behavior.

Forgot to mention: The above commit only exists in the kbuild tree, so I
will apply this there as well, unless anybody objects. Applying the
patch to the ath tree would break the other way around.

Michal
