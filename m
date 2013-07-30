Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:39348 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752062Ab3G3CEq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Jul 2013 22:04:46 -0400
Message-ID: <1375149883.8313.3.camel@concordia>
Subject: Re: kisskb: sparc-allmodconfig is actually sparc64
From: Michael Ellerman <michael@ellerman.id.au>
Date: Tue, 30 Jul 2013 12:04:43 +1000
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

OK this should be fixed.

See http://kisskb.ellerman.id.au/kisskb/buildresult/9234872/

In particular the config at http://kisskb.ellerman.id.au/kisskb/buildresult/9234872/config/

Shows:

CONFIG_SPARC=y
CONFIG_SPARC32=y
# CONFIG_SPARC64 is not set

vs an older result (http://kisskb.ellerman.id.au/kisskb/buildresult/9195810/config/)

CONFIG_64BIT=y
CONFIG_SPARC=y
# CONFIG_SPARC32 is not set


cheers

