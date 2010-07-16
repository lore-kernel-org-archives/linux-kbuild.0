Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:61509 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759141Ab0GPUCP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jul 2010 16:02:15 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] Kconfig: Enable Kconfig fragments to be used for defconfig
Date: Fri, 16 Jul 2010 22:01:09 +0200
References: <20100713230352.6781.18644.stgit@angua> <1279296221.17878.66.camel@e102109-lin.cambridge.arm.com> <AANLkTinyFBTKYaryFANYheTuP-biJUws2x01NRNZPb4M@mail.gmail.com>
In-Reply-To: <AANLkTinyFBTKYaryFANYheTuP-biJUws2x01NRNZPb4M@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201007162201.09629.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, Nicolas Pitre <nico@fluxnic.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, Russell King <rmk@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Daniel Walker <dwalker@codeaurora.org>, Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>

On Friday 16 July 2010 19:57:55 Grant Likely wrote:
> On Fri, Jul 16, 2010 at 10:03 AM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > On Wed, 2010-07-14 at 00:04 +0100, Grant Likely wrote:
> 
> sfr and I were talking about your patch the other day.  Just warning
> on incomplete dependencies is enough to make it actually workable for
> me (without my ugly post-processing step).  I was very happy to hear
> that it is in linux-next.
> 
> Last missing piece is being able to do "select FOO = n", which Stephen
> is currently working on.

Are there a lot of symbols for which this is needed? If there is only
a handful, you could work around this by selectively adding

config FOO
	bool "foo"
	default !FOO_DISABLE

config FOO_DISABLE
	def_bool "n"


		Arnd
