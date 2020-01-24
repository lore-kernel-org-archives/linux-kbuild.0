Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:60422 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387445AbgAXNOJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 08:14:09 -0500
From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: vmlinux ELF header sometimes corrupt
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Date: Fri, 24 Jan 2020 14:14:05 +0100
In-Reply-To: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk> (Rasmus
        Villemoes's message of "Wed, 22 Jan 2020 18:52:21 +0100")
Message-ID: <87sgk5m1ya.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

On Jan 22 2020, Rasmus Villemoes wrote:

> So the inode number and mtime/ctime are exactly the same, but for some
> reason Blocks: has changed? This is on an ext4 filesystem, but I don't
> suspect the filesystem to be broken, because it's always just vmlinux
> that ends up corrupt, and always in exactly this way with the first 52
> bytes having been wiped.

Note that the size of the ELF header (Elf32_Ehdr) is 52 bytes.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
