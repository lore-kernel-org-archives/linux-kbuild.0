Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0160.hostedemail.com ([216.40.44.160]:52461 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751317AbcDZPLl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 11:11:41 -0400
Date: Tue, 26 Apr 2016 11:11:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 4/4] localmodconfig: Recognize standalone "prompt"
Message-ID: <20160426111136.6f8c197f@gandalf.local.home>
In-Reply-To: <1460333193-16361-4-git-send-email-bpoirier@suse.com>
References: <20160410235234.GA13689@f1.synalogic.ca>
	<1460333193-16361-1-git-send-email-bpoirier@suse.com>
	<1460333193-16361-4-git-send-email-bpoirier@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 10 Apr 2016 17:06:33 -0700
Benjamin Poirier <bpoirier@suse.com> wrote:

> Note that this may change the resulting .config, causing it to have fewer
> symbols turned on. Before this patch we incorrectly identified some symbols
> as not having a prompt and needing to be selected by something else.
> 
> Also fix the whitespace repeat after "tristate".
> 
> Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index bbc160c..d465672 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -237,7 +237,7 @@ sub read_kconfig {
>  	    }
>  
>  	# configs without prompts must be selected
> -	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
> +	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {

I'm curious. What modules have tristate and a specified prompt?

That is, what modules are removed with this patch?

I applied the first three so far.

Thanks,

-- Steve

>  	    # note if the config has a prompt
>  	    $prompts{$config} = 1;
>  

