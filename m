Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35507 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754189AbcK3Tfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 14:35:43 -0500
MIME-Version: 1.0
In-Reply-To: <583F1F6A.5010307@redhat.com>
References: <20161130172435.GG8563@redhat.com> <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com>
 <583F1A5A.7040708@redhat.com> <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com>
 <583F1F6A.5010307@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Nov 2016 11:35:42 -0800
Message-ID: <CA+55aFyvvVG2-fZbefGXV_dznz16jfKRFukX1u4hWEtG5DfJMw@mail.gmail.com>
Subject: Re: Odd build breakage in 4.9-rc7
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>, Nicolas Pitre <nico@linaro.org>
Cc: Jarod Wilson <jarod@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Nov 30, 2016 at 10:50 AM, Prarit Bhargava <prarit@redhat.com> wrote:
>
> It comes back.  The steps to reproduce this are:
>
> 1.  checkout latest linux.git
> 2.  make -j112
>
> (IOW, it occurs 100% of the time for me on a clean tree.)

I suspect it's not new, it's just that you are able to hit the timing
just right (and the new include presumable makes that just be much
easier).

The rules for generating include/generated/autoksyms.h aren't new,
they go back to at least 4.7.

Adding Nico to the cc, since he's the person to blame for autokeysyms,
and might have some idea why the dependency wouldn't be done in time.

              Linus
