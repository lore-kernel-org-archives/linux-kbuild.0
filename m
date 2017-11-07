Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f51.google.com ([74.125.83.51]:49314 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753864AbdKGGBP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 01:01:15 -0500
Received: by mail-pg0-f51.google.com with SMTP id g6so10205515pgn.6
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Nov 2017 22:01:14 -0800 (PST)
Date: Mon, 6 Nov 2017 22:01:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: build warning after merge of the regmap tree
Message-ID: <20171107060111.GV28761@minitux>
References: <20171106115214.19cb007a@canb.auug.org.au>
 <20171106152157.2ad9a5a9@canb.auug.org.au>
 <20171106153037.2afa3e7b@canb.auug.org.au>
 <20171106112143.ht4cmm2qngdbmmuy@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171106112143.ht4cmm2qngdbmmuy@sirena.co.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>

On Mon 06 Nov 03:21 PST 2017, Mark Brown wrote:

> On Mon, Nov 06, 2017 at 03:30:37PM +1100, Stephen Rothwell wrote:
> > On Mon, 6 Nov 2017 15:21:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Mon, 6 Nov 2017 11:52:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > > > After merging the regmap tree, today's linux-next build
> > > > (arm_multi_v7_defconfig) produced this warning:
> 
[..]
> isn't one right now.  The root issue here is that HWSPINLOCK can be
> built modular which makes it very painful to use from core code.

I've picked Baolin's patch for making the hwspinlock core bool.
Hopefully this help avoid this issue. Looks like I missed today's
linux-next though.

Regards,
Bjorn
