Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0113.hostedemail.com ([216.40.44.113]:49811 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752014AbcDZTvg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 15:51:36 -0400
Date: Tue, 26 Apr 2016 15:51:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] localmodconfig: Fix whitespace repeat count after
 "tristate"
Message-ID: <20160426155132.3cdf9adf@gandalf.local.home>
In-Reply-To: <1461696998-3953-1-git-send-email-bpoirier@suse.com>
References: <20160426185421.GB2979@f1.synalogic.ca>
	<1461696998-3953-1-git-send-email-bpoirier@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 26 Apr 2016 11:56:38 -0700
Benjamin Poirier <bpoirier@suse.com> wrote:

> Also recognize standalone "prompt".
> 
> Before this patch we incorrectly identified some symbols as not having a
> prompt and potentially needing to be selected by something else.
> 
> Note that this patch could theoretically change the resulting .config,
> causing it to have fewer symbols turned on. However, given the current set
> of Kconfig files, this situation does not occur because the symbols newly
> added to %prompts are absent from %selects.
> 
> Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 95a6f2b..b8c7b29 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -237,7 +237,7 @@ sub read_kconfig {
>  	    }
>  
>  	# configs without prompts must be selected
> -	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
> +	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {

I prefer not to have the "prompt" here. I'm only interested in module
configs. But the \s to \s+ is a real fix.

Can you resend?

-- Steve

>  	    # note if the config has a prompt
>  	    $prompts{$config} = 1;
>  

