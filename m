Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:21282 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752345Ab2CWDqj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Mar 2012 23:46:39 -0400
Message-ID: <4F6BF1F1.3080509@linux.intel.com>
Date: Thu, 22 Mar 2012 20:45:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] merge_config.sh: Set execute bit
References: <1332453949-5872-1-git-send-email-john.stultz@linaro.org> <1332453949-5872-2-git-send-email-john.stultz@linaro.org>
In-Reply-To: <1332453949-5872-2-git-send-email-john.stultz@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Bruce.Ashfield@windriver.com



On 03/22/2012 03:05 PM, John Stultz wrote:
> Somehow the merge_config.sh script didn't get its execute bit
> set when it was merged. Fix this.
> 
> CC: Michal Marek <mmarek@suse.cz>
> CC: Bruce.Ashfield@windriver.com
> CC: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  0 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 scripts/kconfig/merge_config.sh
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> old mode 100644
> new mode 100755

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
