Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40134 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgBCLs1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 06:48:27 -0500
MIME-Version: 1.0
References: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
 <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
 <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com>
 <CAMuHMdWerVTn-RvUOzHzGurY71NP9fNj+24EjnVkxnmp5g94jw@mail.gmail.com> <CAK7LNAQOJGnL62ADL76V_jMm356+1rGxqBRt=BBpvvy+iASniw@mail.gmail.com>
In-Reply-To: <CAK7LNAQOJGnL62ADL76V_jMm356+1rGxqBRt=BBpvvy+iASniw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Feb 2020 12:48:13 +0100
Message-ID: <CAMuHMdVNKp+jsFyyDd+P34QRiBjmYHJKN=77Yt8R+t1ZTS35xw@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Yamada-san,

On Mon, Feb 3, 2020 at 12:38 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Mon, Feb 3, 2020 at 8:00 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Feb 3, 2020 at 2:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > On Sun, Feb 2, 2020 at 3:45 AM Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > > On Fri, Jan 31, 2020 at 8:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > >
> > > > >  - simplify built-in initramfs creation
> > > >
> > > > Hmm.
> > > >
> > > > This may simplify it from a _technical_ angle, but it seems to be a
> > > > fairly annoying step backwards from a UI perspective.
> > > >
> > > > Now Kconfig asks a completely pointless question that most people have
> > > > absolutely zero interest in. The old situation was better, I feel.
> > > >
> > > > Basically, I feel that from a "get normal users to test development
> > > > kernels", our Kconfig pain ends up being the biggest hurdle by far.
> > > >
> > > > The kernel is easy to build and doesn't really require all that much
> > > > infrastructure, but generating the config - particularly when it
> > > > changes over time and you can't just say "just use the distro config"
> > > > - is a big step for people.
> > > >
> > > > So honestly, while I've pulled this, I feel that this kind of change
> > > > is going _exactly_ the wrong way when it asks people questions that
> > > > they don't care one whit about.
> > > >
> > > > If I as a kernel developer can't find it in myself to care and go "why
> > > > does it ask this new question", then that should tell you something.
> > > >
> > > > Why do we have this choice in the first place?
> > >
> > > Generally, initramfs is passed from a boot-loader,
> > > but some architectures embed initramfs into vmlinux
> > > (perhaps due to poor boot-loader support??)
> > >
> > > arch/arc/configs/tb10x_defconfig:CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
> > > arch/unicore32/configs/defconfig:#CONFIG_INITRAMFS_SOURCE="arch/unicore/ramfs/ramfs_config"
> > > arch/xtensa/configs/cadence_csp_defconfig:CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"
> >
> > Note that the above are examples that do not actually work, as the files
> > referred to are not present in mainline (read below[1] why I have just
> > checked that ;-).
> >
> > > So, data-compression is useful - that's is what I understand.
> >
> > Yes it is, depending on your config.
> >
> > > For major architectures, vmlinux embeds a tiny initramfs,
> > > which is generated based on usr/default_cpio_list.
> > >
> > > We do not need data-compression for such a small cpio,
> > > but handling it in a consistent way is sensible.
> > > This is annoying from the users' PoV, I admit.

> > So INITRAMFS_COMPRESSION_NONE is the right answer to retain the
> > old behavior?
>
> Yes, INITRAMFS_COMPRESSION_NONE retains the previous behavior.
>
> But, as far as he I understood what Linus said,
> "we do not care".
>
> > One might question why not to use gzip anyway, as
> > CONFIG_RD_GZIP=y is enabled by default, and would give a (small)
> > improvement of ca. 350 bytes ;-)
> > Hence there is some area for improvement...
>
> GZIP is not the only compression algorithm.
>
> Somebody may want to disable RD_GZIP,
> then enable RD_XZ.

Sure, it can only be used when available.

> If we allow the data compression,
> Kconfig must ask "which compression algorithm".

Or default to one of the available ones.

> So, if Kconfig would siltently choose something
> as default, INITRAMFS_COMPRESSION_NONE would be the best.

Yeah, probably it's good enough.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
