Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:35810 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750902Ab1IHWzO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Sep 2011 18:55:14 -0400
Message-ID: <4E692ED0.5040906@xenotime.net>
Date: Thu, 08 Sep 2011 14:08:32 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: [PATCH] Kconfig: Fix help message for DEFAULT_HUNG_TASK_TIMEOUT
References: <1314783809-20903-1-git-send-email-jjzhang@suse.de>
In-Reply-To: <1314783809-20903-1-git-send-email-jjzhang@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiaju Zhang <jjzhang@suse.de>
Cc: linux-kbuild@vger.kernel.org, jkosina@suse.cz, mmarek@suse.cz

On 08/31/11 02:43, Jiaju Zhang wrote:
> Added missing _secs in the help message of config DEFAULT_HUNG_TASK_TIMEOUT.
> 
> Signed-off-by: Jiaju Zhang <jjzhang@suse.de>
> ---
>  lib/Kconfig.debug |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index c0cb9c4..f285553 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -248,8 +248,9 @@ config DEFAULT_HUNG_TASK_TIMEOUT
>  	  to determine when a task has become non-responsive and should
>  	  be considered hung.
>  
> -	  It can be adjusted at runtime via the kernel.hung_task_timeout
> -	  sysctl or by writing a value to /proc/sys/kernel/hung_task_timeout.
> +	  It can be adjusted at runtime via the kernel.hung_task_timeout_secs
> +	  sysctl or by writing a value to
> +	  /proc/sys/kernel/hung_task_timeout_secs.
>  
>  	  A timeout of 0 disables the check.  The default is two minutes.
>  	  Keeping the default should be fine in most cases.

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Jiri, merge in trivial tree?

Jiaju, would you also add 'hung_task_timeout_secs' to
Documentation/sysctl/kernel.txt, please?


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
