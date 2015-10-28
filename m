Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38921 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754827AbbJ1HLZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 03:11:25 -0400
Date: Wed, 28 Oct 2015 16:11:19 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 08/10] merge_config.sh: use trap for cleanup
Message-ID: <20151028071119.GK1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-9-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-9-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:09AM +0900, Olof Johansson wrote:
> Use the trap to cleanup even on regular exit.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  scripts/kconfig/merge_config.sh | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 1945b2c..b26c0ef 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -23,10 +23,12 @@
>  EXITVAL=0
>  
>  clean_up() {
> -	rm -f $TMP_FILE
> +	if [ -n "$CLEAN_FILES" ] ; then
> +		rm -f $CLEAN_FILES

Hrm... where did CLEAN_FILES come from? I dodn't see it in master and I don't
see it in patches 1-7. Did I miss it?

-- 
Darren Hart
Intel Open Source Technology Center
