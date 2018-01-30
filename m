Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45162 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751766AbeA3Se6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 13:34:58 -0500
Message-ID: <1517337292.2230.15.camel@tiscali.nl>
Subject: Re: [PATCH] kconfig: Warn if help text is blank
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 30 Jan 2018 19:34:52 +0100
In-Reply-To: <20180130181853.32512-1-ulfalizer@gmail.com>
References: <20180130181853.32512-1-ulfalizer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: yamada.masahiro@socionext.com, mcgrof@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, 2018-01-30 at 19:18 +0100, Ulf Magnusson wrote:
> Print a warning if a 'help' token is given but the help text is blank.
> Personal pet peeve.
> 
> Example warnings:
> 
> 	net/sched/Kconfig:860: warning: 'NET_IFE_SKBMARK' defined with blank help text
> 	net/sched/Kconfig:865: warning: 'NET_IFE_SKBPRIO' defined with blank help text
> 	net/sched/Kconfig:870: warning: 'NET_IFE_SKBTCINDEX' defined with blank help text
> 	drivers/video/fbdev/Kconfig:1159: warning: 'FB_I810_I2C' defined with blank help text
> 	drivers/mmc/host/Kconfig:877: warning: 'MMC_TOSHIBA_PCI' defined with blank help text
> 	drivers/staging/rtl8192u/Kconfig:8: warning: 'RTL8192U' defined with blank help text
> 	drivers/staging/rtl8192e/rtl8192e/Kconfig:9: warning: 'RTL8192E' defined with blank help text
> 	lib/Kconfig.debug:354: warning: 'ARCH_WANT_FRAME_POINTERS' defined with blank help text
> 
> A separate patchset will be sent to fix all current instances of blank
> help texts for all arches. I added the same warning to Kconfiglib.

If you do this it would be better to first fix or remove those help texts, and
only then add this warning. Ie, add the warning in the last patch of a cleanup
series.

> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -436,6 +436,12 @@ help: help_start T_HELPTEXT
>  		zconfprint("warning: '%s' defined with more than one help text -- only the last one will be used",
>  			   current_entry->sym->name ?: "<choice>");
>  	}
> +
> +	/* Is the help text empty or all whitespace? */
> +	if ($2[strspn($2, " \f\n\r\t\v")] == '\0')
> +		zconfprint("warning: '%s' defined with blank help text",
> +			   current_entry->sym->name ?: "<choice>");
> +

Does this go to stderr?

Another fix would be to ignore empty help texts and not render them at all. Is
that possible?

Thanks,


Paul Bolle
