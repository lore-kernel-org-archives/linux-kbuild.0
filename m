Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcdn-iport-5.cisco.com ([173.37.86.76]:50845 "EHLO
        rcdn-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbeKOKwi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 05:52:38 -0500
Date: Wed, 14 Nov 2018 16:47:06 -0800
From: Daniel Walker <danielwa@cisco.com>
Subject: Re: hidden string Kconfig ?
Message-ID: <20181115004706.r6azcyjd2fhtktio@zorba>
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba>
 <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
 <20181115000756.k2fsgzmswdbikpfb@zorba>
 <c13367b1-c28b-b889-ed91-233090f1410c@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13367b1-c28b-b889-ed91-233090f1410c@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Wed, Nov 14, 2018 at 04:37:43PM -0800, Randy Dunlap wrote:
> On 11/14/18 4:07 PM, Daniel Walker wrote:
> > On Wed, Nov 14, 2018 at 03:16:17PM -0800, Randy Dunlap wrote:
> >> Hi,
> >>
> >> There are several "string" Kconfig symbols in init/Kconfig that do not have
> >> a prompt string after them.  I believe that these do what you are asking about.
> >> If not, please provide your example that is not working.
> >>
> >> Or:  this one works for me:
> >>
> >> ---
> >>  init/Kconfig |    4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> --- linux-next-20181114.orig/init/Kconfig
> >> +++ linux-next-20181114/init/Kconfig
> >> @@ -1858,6 +1858,10 @@ config CMDLINE
> >>  
> >>  endif
> >>  
> >> +config SPECIAL_STRING
> >> +	string
> >> +	default "special"
> >> +
> >>  endmenu		# General setup
> >>  
> >>  source "arch/Kconfig"
> >>
> >>
> >> and "make oldconfig" gives me a .config file that contains:
> >> CONFIG_SPECIAL_STRING="special"
> > 
> > I have this (in init/Kconfig),
> > 
> > config CMDLINE
> >         string
> > 
> > then inside my .config I have this,
> > CONFIG_CMDLINE="console=ttyS0"
> > 
> > if you run  "make menuconfig", and change something then save. The
> > CONFIG_CMDLINE is gone.
> > 
> > What I would want is for that option to remain untouched.
> 
> Interesting.  I guess luckily for me I was testing with today's linux-next,
> which contains the CMDLINE Kconfig symbols in init/Kconfig, including this one:
> 
> config CMDLINE
> 	string ""
> 
> 
> and that does work with your "console=ttyS0" + make oldconfig or make xconfig.
> 
> But apparently the string does need to have a prompt ("").
> Without that (as you listed it), the value does disappear.

Yeah, the patch your talking about is from my -next tree. I'm trying to get rid
of the prompt .. There is no description, and no one should be setting that.
It's only there so that people don't lose their old CONFIG_CMDLINE.

It seems like Kconfig should be able to handle this because you may have an
obsolete string option which you may want to retain silently in the Kconfig.

Daniel
