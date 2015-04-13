Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud6.xs4all.net ([194.109.24.24]:58273 "EHLO
	lb1-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751594AbbDMGyT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 02:54:19 -0400
Message-ID: <1428908056.11113.11.camel@x220>
Subject: Re: [PATCH] kconfig: Add support for floating point configuration
 variables
From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 13 Apr 2015 08:54:16 +0200
In-Reply-To: <552B2D74.7020304@infradead.org>
References: <20150412211624.GA19749@localhost.localdomain>
	 <552B2D74.7020304@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David VomLehn <dvomlehn@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org

[Removed Yann, who has disappeared long ago.]

On Sun, 2015-04-12 at 19:44 -0700, Randy Dunlap wrote:
> On 04/12/15 14:16, David VomLehn wrote:
> > Add support for floating point configuration variables using C syntax.
> 
> Missing justification.
> 
> Missing explanation (or deletion) of
> +FILE *log_fp; etc.
> 
> 
> > ---
> >  kconfig-frontends/docs/kconfig-language.txt |    2 +-
> >  kconfig-frontends/frontends/conf/conf.c     |    3 +++
> >  kconfig-frontends/frontends/gconf/gconf.c   |    3 +++
> >  kconfig-frontends/frontends/mconf/mconf.c   |    4 ++++
> >  kconfig-frontends/frontends/nconf/nconf.c   |    3 +++
> >  kconfig-frontends/frontends/qconf/qconf.cc  |    3 +++
> >  kconfig-frontends/libs/parser/symbol.c      |   24 +++++++++++++++++++++---
> >  kconfig-frontends/utils/gettext.c           |    3 +++
> >  8 files changed, 41 insertions(+), 4 deletions(-)

This was apparently not done on top of the kernel's code. Is this
perhaps intended for some out of tree project?

Before you consider to resend this as a patch for the kernel, you should
know that a proper commit explanation is needed, as Randy already told,
before most people even consider actually looking at it. A Signed-off-by
tag will also be required, by the way.

Thanks,


Paul Bolle

