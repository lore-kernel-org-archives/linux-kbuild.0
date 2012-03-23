Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:52612 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755054Ab2CWM7f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Mar 2012 08:59:35 -0400
Message-ID: <4F6C7390.3080208@windriver.com>
Date: Fri, 23 Mar 2012 08:58:56 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] merge_config.sh: Set execute bit
References: <1332453949-5872-1-git-send-email-john.stultz@linaro.org> <1332453949-5872-2-git-send-email-john.stultz@linaro.org>
In-Reply-To: <1332453949-5872-2-git-send-email-john.stultz@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Darren Hart <dvhart@linux.intel.com>

On 12-03-22 06:05 PM, John Stultz wrote:
> Somehow the merge_config.sh script didn't get its execute bit
> set when it was merged. Fix this.
>
> CC: Michal Marek<mmarek@suse.cz>
> CC: Bruce.Ashfield@windriver.com
> CC: Darren Hart<dvhart@linux.intel.com>
> Signed-off-by: John Stultz<john.stultz@linaro.org>

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Bruce

> ---
>   0 files changed, 0 insertions(+), 0 deletions(-)
>   mode change 100644 =>  100755 scripts/kconfig/merge_config.sh
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> old mode 100644
> new mode 100755

