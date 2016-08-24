Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:52703 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753488AbcHXNJ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Aug 2016 09:09:56 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/3 v3] kbuild changes, thin archives, --gc-sections
Date: Wed, 24 Aug 2016 15:06:39 +0200
Message-ID: <1686648.CKXrTpUETq@wuerfel>
In-Reply-To: <1472041761-14414-1-git-send-email-npiggin@gmail.com>
References: <1472041761-14414-1-git-send-email-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@linaro.org>, Segher Boessenkool <segher@kernel.crashing.org>, Alan Modra <amodra@gmail.com>

On Wednesday, August 24, 2016 10:29:18 PM CEST Nicholas Piggin wrote:
> Hi Michal,
> 
> I ended up deciding to do a v3, because I had several changes
> accumulated, as described in patches.
> 
> I've also left off the powerpc arch patches -- they can be found
> in previous posts, for reference.
> 
> I've again tested ARM and it seems to be building okay and without
> performance regression with my configurations. I think it's going
> to be a matter of some toolchain options for them to go through.
> arm64, x86, powerpc, and arm for me all built fine with thin archives
> and --gc-sections enabled, so I can't see there being a fundamental
> issue that can't be solved. Worst case, the incremental link option
> can remain for a time.
> 

I clearly want to use this on ARM, and I am still investigating
the performance regression that I see on my build box, but that
is no reason to delay your patches.

Everything looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
