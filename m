Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:53496 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbgDCKTd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 06:19:33 -0400
Date: Fri, 3 Apr 2020 12:19:29 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Message-ID: <20200403101929.GC20218@zn.tnic>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
 <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com>
 <20200402155810.GD9352@zn.tnic>
 <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>

On Thu, Apr 02, 2020 at 08:25:49PM +0000, Nick Terrell wrote:
> So it is possible that there is a use case for kernel compression that
> I’m not aware of where RAM is extremely tight and within 64 KB of
> the current limits.

That's exactly my concern, albeit a very minor one.

> It seems to me that adding 64KB to the memory requirement for kernel
> decompression is not going to break anyone. If it did the kernel image
> is taking up nearly all available RAM, which doesn’t seem likely.
> But, I don’t know all use cases. If it does break someone, we can
> put up a separate patch that switches all the compression methods over
> a per-method ZO_z_extra_bytes.

Ok.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
