Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39278 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932492AbbJ1HW4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 03:22:56 -0400
Date: Wed, 28 Oct 2015 16:22:45 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 09/10] merge_config.sh: allow single configs to be passed
 in on cmdline
Message-ID: <20151028072245.GL1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-10-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-10-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:10AM +0900, Olof Johansson wrote:
> Treat CONFIG_FOO=..  on the command line the same way as a single-entry file would.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  scripts/kconfig/merge_config.sh | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index b26c0ef..69463dd 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -1,8 +1,8 @@
>  #!/bin/sh
> -#  merge_config.sh - Takes a list of config fragment values, and merges
> -#  them one by one. Provides warnings on overridden values, and specified
> -#  values that did not make it to the resulting .config file (due to missed
> -#  dependencies or config symbol removal).
> +#  merge_config.sh - Takes a list of config fragment filenames or configuration
> +#  value, and merges them one by one. Provides warnings on overridden values,
> +#  and specified values that did not make it to the resulting .config file
> +#  (due to missed dependencies or config symbol removal).
>  #
>  #  Portions reused from kconf_check and generate_cfg:
>  #  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/kconf_check
> @@ -108,7 +108,26 @@ fi
>  
>  MERGE_LIST=$*
>  SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> -TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> +TMP_FILE=$(mktemp $OUTPUT/.tmp.config.XXXXXXXXXX)
> +
> +CLEAN_FILES=$TMP_FILE

Oh, here it is :-) Looks like this should come before 8/10 ?

But, content is good. Multiple files are needed in case CONFIG_* options are
intermixed with file fragments.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
