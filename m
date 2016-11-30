Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34023 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756593AbcK3SgL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 13:36:11 -0500
MIME-Version: 1.0
In-Reply-To: <583F1A5A.7040708@redhat.com>
References: <20161130172435.GG8563@redhat.com> <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com>
 <583F1A5A.7040708@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Nov 2016 10:36:05 -0800
Message-ID: <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com>
Subject: Re: Odd build breakage in 4.9-rc7
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>
Cc: Jarod Wilson <jarod@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Nov 30, 2016 at 10:28 AM, Prarit Bhargava <prarit@redhat.com> wrote:
]>
> In my case I tracked this to commit 3637efb00864 ("x86/mce: Add PCI quirks to
> identify Xeons with machine check recovery") which adds the include for
> generated/autoksyms.h.

Ok, that at least makes some sense. The other blamed commit did not
seem to possibly make a difference.

> Searching LKML and I came across a report from Ken Moffat from a month ago:
>
> http://marc.info/?l=linux-kernel&m=147794681124332&w=2

Does a "make clean" get rid of it forever? Or does it come back?

If it's a one-time dependency issue that is because some header
dependency addition that the automatic dependency generator hadn't
caught, that might explain a bisection failure too: once the file
happens to get rebuilt (and the dependencies re-done), it starts
working even though the "happens to be rebuilt" had nothing to do with
the original bug.

               Linus
