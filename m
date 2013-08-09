Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:65268 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934342Ab3HIPNv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 11:13:51 -0400
Date: Fri, 9 Aug 2013 17:13:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Allow scripts/* to be cross compiled
Message-ID: <20130809151346.GA6021@merkur.ravnborg.org>
References: <1376046432-12588-1-git-send-email-broonie@kernel.org> <20130809123251.GB5794@merkur.ravnborg.org> <20130809150031.GE6427@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130809150031.GE6427@sirena.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, linaro-kernel@lists.linaro.org, linux-kbuild@vger.kernel.org, John Rigby <john.rigby@linaro.org>

On Fri, Aug 09, 2013 at 04:00:31PM +0100, Mark Brown wrote:
> On Fri, Aug 09, 2013 at 02:32:51PM +0200, Sam Ravnborg wrote:
> > On Fri, Aug 09, 2013 at 12:07:12PM +0100, Mark Brown wrote:
> > > From: John Rigby <john.rigby@linaro.org>
> 
> > > Cross compiling the binaries in scripts/* is not possible
> > > because various makefiles assume that $(obj)/whatever is
> > > executable on the build host.
> 
> > Please explain what problem you are trying to solve with this.
> > I do not understand the rationale behind this patch from the above.
> 
> OK...  I'd have thought that cross compliation was enough of a rationale
> to be honest.
The way I understand cross compilation is that for example you
build for arm - on your x86 box.
This is supported today.

So you need to explain your interpretation of cross compilation
and why this patch is needed.
Because I do not get it.

	Sam



