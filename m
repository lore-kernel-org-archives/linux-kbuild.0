Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from benson.vm.bytemark.co.uk ([212.110.190.137]:57681 "EHLO
	benson.vm.bytemark.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751894AbaFJIbm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 04:31:42 -0400
Message-ID: <1402389097.1823.14.camel@kazak.uk.xensource.com>
Subject: Re: [PATCH v2 1/1] builddeb: add arm64 in the supported
 architectures
From: Ian Campbell <ijc@hellion.org.uk>
Date: Tue, 10 Jun 2014 09:31:37 +0100
In-Reply-To: <CAGNsrLAiK88Lfz1nhZgB8FUgCDO88g462uJG+yKZ139_AZymeA@mail.gmail.com>
References: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
	 <1397307186-3977-2-git-send-email-fathi.boudra@linaro.org>
	 <1397395563.10849.79.camel@deadeye.wl.decadent.org.uk>
	 <1402272928.23860.55.camel@deadeye.wl.decadent.org.uk>
	 <CAGNsrLAiK88Lfz1nhZgB8FUgCDO88g462uJG+yKZ139_AZymeA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>

On Tue, 2014-06-10 at 11:15 +0300, Fathi Boudra wrote:
> On 9 June 2014 03:15, Ben Hutchings <ben@decadent.org.uk> wrote:
> > On Sun, 2014-04-13 at 14:26 +0100, Ben Hutchings wrote:
> >> On Sat, 2014-04-12 at 15:53 +0300, Fathi Boudra wrote:
> >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> >>
> >> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> >>
> >> > ---
> >> >  scripts/package/builddeb | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> >> > index f46e4dd..0bf29a6 100644
> >> > --- a/scripts/package/builddeb
> >> > +++ b/scripts/package/builddeb
> >> > @@ -42,6 +42,8 @@ create_package() {
> >> >             debarch=hppa ;;
> >> >     mips*)
> >> >             debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
> >> > +   arm64)
> >
> > Now I'm not so sure.  As we are comparing with the 'machine' name
> > ($UTS_MACHINE, not $ARCH or $SRCARCH), shouldn't this actually check for
> > aarch64?
> 
> not sure. I've seen Ian comment (added to the cc list).

The patch above produced the right thing when crossbuilt with
ARCH=arm64. e.g. linux-image-3.14.5+_3.14.5+-2_arm64.deb

With just Ben's original patch it produced linux-image-3.14.5+_3.14.5
+-2_arm.deb instead.

I think UTS_MACHINE is correct because:

Makefile:UTS_MACHINE    := $(ARCH)

and there is no override in arch/arm*/Makefile.

So the kernel arch is the correct thing to use here.

Ian.

