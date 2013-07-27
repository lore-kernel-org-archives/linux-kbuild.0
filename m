Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:34190 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751503Ab3G0Nia (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Jul 2013 09:38:30 -0400
Message-ID: <1374932307.7730.3.camel@concordia>
Subject: Re: kisskb: sparc-allmodconfig is actually sparc64
From: Michael Ellerman <michael@ellerman.id.au>
Date: Sat, 27 Jul 2013 23:38:27 +1000
In-Reply-To: <CAMuHMdUjaGRnHZpxs1j4VkYgTUXQNXvqu8LstpxLe8tYdf1oVw@mail.gmail.com>
References: <CAMuHMdUjaGRnHZpxs1j4VkYgTUXQNXvqu8LstpxLe8tYdf1oVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, sparclinux <sparclinux@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, 2013-07-26 at 12:23 +0200, Geert Uytterhoeven wrote:
> Hi Michael, Stephen,
> 
> The sparc-allmodconfig builds on http://kisskb.ellerman.id.au/kisskb/matrix/
> seem to be sparc64, not sparc32, allmodconfig builds.
> The sparc-allnoconfig builds are sparc32.

Ah right, we seem to have sparc and sparc64 builds, but there is only
arch/sparc now.

We'll have to sort that out next week.

> BTW, what's the simplest way to make an all*config build with fixed sparc32 or
> sparc64?

I think you can do it with KCONFIG_ALLCONFIG.

cheers

