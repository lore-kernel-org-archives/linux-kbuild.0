Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 64.mail-out.ovh.net ([91.121.185.65]:49328 "HELO
	64.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751561Ab1ERF2K (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 May 2011 01:28:10 -0400
Date: Wed, 18 May 2011 07:16:45 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] kconfig: Only generate config_is_xxx for bool and
 tristate options
Message-ID: <20110518051645.GB15292@game.jcrosoft.org>
References: <1305646532-29114-1-git-send-email-mmarek@suse.cz>
 <20110517195310.GA17003@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110517195310.GA17003@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 21:53 Tue 17 May     , Sam Ravnborg wrote:
> On Tue, May 17, 2011 at 05:35:32PM +0200, Michal Marek wrote:
> > For strings and integers, the config_is_xxx macros are useless and
> > sometimes misleading:
> > 
> >   #define CONFIG_INITRAMFS_SOURCE ""
> >   #define config_is_initramfs_source() 1
> 
> I'm late with this comment....
> Could we introduce "config_is_foo" using a syntax that
> does not break grepability?
> 
> Maybe a syntax like this?
> 
>     #ifdef CONFIG_FOO
> 
> and
> 
>     if (KCONFIG_FOO())
> 
> Grepping for the use of a symbol is a very typical thing,
> so we should try to keep this.
> And with the suggested syntax above I expect fixdep to
> catch up both usage types.
I'll prefer kconfig_foo()
not uppercase

but if we use KCONFIG_FOO no need to touch fixdep

Best Regards,
J.
