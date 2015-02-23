Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:58827 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751413AbbBWJ7p (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2015 04:59:45 -0500
MIME-Version: 1.0
In-Reply-To: <1421737558-14756-1-git-send-email-mpe@ellerman.id.au>
References: <1421737558-14756-1-git-send-email-mpe@ellerman.id.au>
Date: Mon, 23 Feb 2015 10:59:44 +0100
Message-ID: <CAMuHMdXXoqhwEf6P0pbJb_JkEKkK4bOGBVt8jG-gqKYBBDeHQA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Update all configs using savedefconfig
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linuxppc-dev <linuxppc-dev@ozlabs.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Michael,

On Tue, Jan 20, 2015 at 8:05 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> It looks like it's ~4 years since we updated some of these, so do a bulk
> update.
>
> Verified that the before and after generated configs are exactly the
> same.

Yep, that's guaranteed by the tool (modulo bugs).

> Which begs the question why update them? The answer is that it can be
> confusing when the stored defconfig drifts too far from the generated
> result.

And it becomes hard to update them, e.g. for enabling or disabling a single
option.

Now the big question is: do they still work?
Plainly ignoring any bugs introduced in the code, there are probably several
"select" statements that have been removed. 4 years ago, they automatically
selected some critical options, while now, they're no longer selected, causing
breakage.

I'm afraid the only safe way is (for all 108 defconfig files):
  - start from the full .config file, as generated from the minimal defconfig
    file in a source tree from 4 years ago,
  - run "make oldconfig" (boring),
  - run "make savedefconfig",
  - update the minimal defconfig.

The boring step can be made a little bit less boring by making a diff between
the .config versions before and after running the first "make oldconfig",
and applying that to the later .config files first, but it's still a tedious
task, especially after 4 years. That's why I do this (for m68k) on every rc
release.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
