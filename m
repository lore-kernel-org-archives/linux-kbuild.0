Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:58952 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758483AbYEAVlp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 17:41:45 -0400
Date: Thu, 1 May 2008 23:42:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: `sed`ing asm-offsets (Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas)
Message-ID: <20080501214219.GA8386@uranus.ravnborg.org>
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net> <20080501120616.GY29330@cs181133002.pp.htv.fi> <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net> <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501185352.GU24008@flower.upol.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080501185352.GU24008@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@flower.upol.cz>
Cc: sampo@symlabs.com, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org

On Thu, May 01, 2008 at 08:53:53PM +0200, Oleg Verych wrote:
> sampo@symlabs.com @ Thu, May 01, 2008 at 07:10:42PM +0200:
> 
> > > If you run
> > >
> > >   sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /*
> > > \3 */:; s:->::; p;}" < asm-offsets.s
> > >
> 
> Here is side-problem with this script, which manifests itself as so:
...
Can you come up with a _minimal_ fix that makes it compatible with
busy-box AND GNU sed?

It would be nice if we can build a 'normal' kernel with just busy-box
utils one day.

	Sam
