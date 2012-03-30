Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37621 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935795Ab2C3W1y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Mar 2012 18:27:54 -0400
Date: Fri, 30 Mar 2012 15:16:47 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/2] merge_config.sh: Set execute bit
Message-ID: <20120330131646.GB11444@sepie.suse.cz>
References: <1332453949-5872-1-git-send-email-john.stultz@linaro.org>
 <1332453949-5872-2-git-send-email-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332453949-5872-2-git-send-email-john.stultz@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Bruce.Ashfield@windriver.com, Darren Hart <dvhart@linux.intel.com>

On Thu, Mar 22, 2012 at 03:05:48PM -0700, John Stultz wrote:
> Somehow the merge_config.sh script didn't get its execute bit
> set when it was merged. Fix this.

Most likely non-git diff was used as carrier at some point.

> 
> CC: Michal Marek <mmarek@suse.cz>
> CC: Bruce.Ashfield@windriver.com
> CC: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  0 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 scripts/kconfig/merge_config.sh
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> old mode 100644
> new mode 100755

Applied to kbuild.git#misc, thanks.

Michal
