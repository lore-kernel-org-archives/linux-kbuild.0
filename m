Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:42518 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389318AbgDBP6P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 11:58:15 -0400
Date: Thu, 2 Apr 2020 17:58:10 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Message-ID: <20200402155810.GD9352@zn.tnic>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
 <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>

On Wed, Apr 01, 2020 at 05:33:03PM +0000, Nick Terrell wrote:
> The code is currently written so that all the compression algorithms use the
> same ZO_z_extra_bytes. It is taken to be the maximum of the growth rate
> plus the maximum fixed overhead. Just a few lines above is the comment:
> 
> # … Hence safety
> # margin should be updated to cover all decompressors so that we don't
> # need to deal with each of them separately. Please check
> # the description in lib/decompressor_xxx.c for specific information.
> 
> So I was been following the guidance in the comments.

Please state that in the commit message when you send your next
revision.

> Does it matter? I’m not an expert here,

Huh, you're only sending the code then? Or what do you mean with not
being an expert?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
