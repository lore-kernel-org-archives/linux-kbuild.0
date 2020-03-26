Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40067 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgCZUQq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:16:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id a81so8994327wmf.5
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 13:16:43 -0700 (PDT)
Date: Thu, 26 Mar 2020 21:16:34 +0100
From: Petr Malat <oss@malat.biz>
Subject: Re: [PATCH v3 3/8] lib: add zstd support to decompress
Message-ID: <20200326201634.GA9948@ntb.petris.klfree.czf>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
 <20200326164732.GA17157@ntb.petris.klfree.czf>
 <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>

Hi!
On Thu, Mar 26, 2020 at 07:03:54PM +0000, Nick Terrell wrote:
> >> * Add unzstd() and the zstd decompress interface.
> > Here I do not understand why you limit the window size to 8MB even when
> > you read a larger value from the header. I do not see a reason why there
> > should be such a limitation at the first place and if there should be,
> > why it differs from ZSTD_WINDOWLOG_MAX.
> 
> When we are doing streaming decompression (either flush or fill is provided)
> we have to allocate memory proportional to the window size. We want to
> bound that memory so we don't accidentally allocate too much memory.
> When we are doing a single-pass decompression (neither flush nor fill
> are provided) the window size doesn't matter, and we only have to allocate
> a fixed amount of memory ~192 KB.
>
> The zstd spec [0] specifies that all decoders should allow window sizes
> up to 8 MB. Additionally, the zstd CLI won't produce window sizes greater
> than 8 MB by default. The window size is controlled by the compression
> level, and can be explicitly set.
Yes, one needs to pass --ultra option to zstd to produce an incompatible
archive, but that doesn't justify the reason to limit this in the kernel,
especially if one is able to read the needed window size from the header
when allocating the memory. At the time when initramfs is extracted,
there usually is memory available as it's before any processes are
started and this memory is reclaimed after the decompression.

If, on the other hand, an user makes an initramfs for a memory constrained
system, he limits the window size while compressing the archive and
the small window size will be announced in the header.

The only scenario where using the hard-coded limit makes sense is in a
case the window size is not available (I'm not sure if it's mandatory
to provide it). That's how my code works - if the size is available,
it uses the provided value, if not it uses 1 << ZSTD_WINDOWLOG_MAX.

I would also agree a fixed limit would make a sense if a user (or network)
provided data would be used, but in this case only the system owner is able
to provide an initramfs. If one is able to change initramfs, he can render
the system unusable simply by providing a corrupted file. He doesn't have
to bother making the window bigger than the available memory.

> I would expect larger window sizes to be beneficial for compression ratio,
> though there is demising returns. I would expect that for kernel image
> compression larger window sizes are beneficial, since it is decompressed
> with a single pass. For initramfs decompression, I would expect that limiting
> the window size could help decompression speed, since it uses streaming
> compression, so unzstd() has to allocate a buffer of window size bytes.
Yes, larger window improves the compression ratio, see here a comparison
between level 19 and 22 on my testing x86-64 initramfs:
  30775022 rootfs.cpio.zst-19
  28755429 rootfs.cpio.zst-22
These 7% can be noticeable when one has a slow storage, e.g. a flash memory
on SPI bus. 

> > I removed that limitation to be able to test it in my environment and I
> > found the performance is worst than with my patch by roughly 20% (on
> > i7-3520M), which is a major drawback considering the main motivation
> > to use zstd is the decompression speed. I will test on arm as well and
> > share the result tomorrow.
> >  Petr
> 
> What do you mean by that? Can you share with me the test you ran?
> Is this for kernel decompression or initramfs decompression?
Initramfs - you can apply my v2 patch on v5.5 and try with your test data.

I have tested your patch also on ARMv7 platform and there the degradation
was 8%.
  Petr
