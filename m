Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41710 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754307AbcKYOpR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Nov 2016 09:45:17 -0500
Date: Fri, 25 Nov 2016 15:44:40 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH ping] builddeb: fix cross-building to arm64 producing
 host-arch debs
Message-ID: <20161125144440.GA2826@sepie.suse.cz>
References: <20161124012703.15704-1-kilobyte@angband.pl>
 <CAAqcGH=BMxduGp=sVwptTTONGuH-uo6vog=4u0HJDSDNekCShQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAqcGH=BMxduGp=sVwptTTONGuH-uo6vog=4u0HJDSDNekCShQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Adam Borowski <kilobyte@angband.pl>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Nov 25, 2016 at 01:36:21PM +0200, Riku Voipio wrote:
> On 24 November 2016 at 03:27, Adam Borowski <kilobyte@angband.pl> wrote:
> > Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
> > "aarch64".  Recognizing just the latter should be enough but let's
> > accept both in case something regresses again or an user sets
> > UTS_MACHINE=arm64.
> >
> > Regressed in cfa88c7: arm64: Set UTS_MACHINE in the Makefile.
> >
> > Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> > Acked-by: Riku Voipio <riku.voipio@linaro.org>
> > ---
> > As 4.9 is not only a LTS, but also the kernel Debian stretch will use,
> > fixing this regression would be really nice.
> 
> Yes, this would be really appreciated.

This is in kbuild.git#rc-fixes now.

Thanks,
Michal
