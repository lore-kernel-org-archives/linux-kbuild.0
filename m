Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:48084 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456Ab3KPBCi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Nov 2013 20:02:38 -0500
Message-ID: <5286C42C.4050800@codeaurora.org>
Date: Fri, 15 Nov 2013 17:02:36 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: Have make TAGS not include structure members
References: <20131115093645.6dc03918@gandalf.local.home>
In-Reply-To: <20131115093645.6dc03918@gandalf.local.home>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Yang Bai <hamo.by@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On 11/15/13 06:36, Steven Rostedt wrote:
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index 74f02e4..b985371 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -218,7 +218,7 @@ exuberant()
>  
>  emacs()
>  {
> -	all_target_sources | xargs $1 -a                        \
> +	all_target_sources | xargs $1 -a --no-members           \
>  	--regex='/^\(ENTRY\|_GLOBAL\)(\([^)]*\)).*/\2/'         \
>  	--regex='/^SYSCALL_DEFINE[0-9]?(\([^,)]*\).*/sys_\1/'   \
>  	--regex='/^TRACE_EVENT(\([^,)]*\).*/trace_\1/'		\
> @@ -248,13 +248,13 @@ emacs()
>  	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
>  	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'
>  
> -	all_kconfigs | xargs $1 -a                              \
> +	all_kconfigs | xargs $1 -a --no-members                 \
>  	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'
>  
> -	all_kconfigs | xargs $1 -a                              \
> +	all_kconfigs | xargs $1 -a --no-members                 \
>  	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/CONFIG_\3/'
>  
> -	all_defconfigs | xargs -r $1 -a                         \
> +	all_defconfigs | xargs -r $1 -a --no-members            \
>  	--regex='/^#?[ \t]?\(CONFIG_[a-zA-Z0-9_]+\)/\1/'
>  }
>  

Does it actually matter for the kconfigs and defconfigs?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

