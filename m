Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:33366 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684AbbJLHGg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Oct 2015 03:06:36 -0400
Received: by wicge5 with SMTP id ge5so5289243wic.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2015 00:06:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJhHMCA=CGdBdnGKzG05HDPOESgGZvZ=VwDTMUnpgT==mKSe3w@mail.gmail.com>
References: <CAJhHMCA=CGdBdnGKzG05HDPOESgGZvZ=VwDTMUnpgT==mKSe3w@mail.gmail.com>
Date: Mon, 12 Oct 2015 10:06:35 +0300
Message-ID: <CAAqcGHnYG7tOSrwpXHYh1hjWoOirph2C8H+pk6sK49cZ-qd01Q@mail.gmail.com>
Subject: Re: bindeb-pkg error (was Re: kbuild misc changes for v4.3-rc1 )
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pranith Kumar <bobby.prani+lkml@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On 12 October 2015 at 05:58, Pranith Kumar <bobby.prani+lkml@gmail.com> wrote:
> Hi Michal,

Hi Pranith,

I've trimmed the CC-list - I doubt all those people care about
building kernel debian packages, and presume they get to read this via
lkml/linux-kbuild anyways.

> Other than that, I keep seeing these errors now:
> dpkg-genchanges: error: cannot fstat file
> ../linux-firmware-image-4.3.0-rc4_4.3.0-rc4-7_powerpc.deb: No such
> file or directory
> scripts/package/Makefile:97: recipe for target 'bindeb-pkg' failed

Fix for that error has been picked up by Andrew Morton:

http://ozlabs.org/~akpm/mmotm/broken-out/builddeb-remove-debian-files-before-build.patch

Riku
