Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([54.37.238.230]:45290 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731680AbgDAH13 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 03:27:29 -0400
Date: Wed, 1 Apr 2020 09:27:25 +0200
From: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Message-ID: <20200401072725.GB27371@angband.pl>
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
 <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
 <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: "sedat.dilek@gmail.com" <sedat.dilek@gmail.com>, Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Nick Desaulniers <ndesaulniers@google.com>

On Wed, Apr 01, 2020 at 02:52:06AM +0000, Nick Terrell wrote:
> > On Mar 31, 2020, at 8:11 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > On Tue, Mar 31, 2020 at 6:15 AM Nick Terrell <terrelln@fb.com> wrote:
> >>> Do you plan to push this for Linux v5.7?
> >> 
> >> I hope that it will be accepted. From my point of view this patch set is
> >> ready for merge, except for the maximum window size increase
> >> requested by Petr.

If you target 5.7, remember that the merge window for 5.7 is already going
on, and Linus is extremely cranky about pulling anything that hasn't stewed
in next for a while.

Your patchset hasn't been in next yet, so the timing is very very late. 
You'd need to bother Stephen Rothwell or someone who has a tree in next
about right now to have any chances.

> > Is it possible to mention that there might distro-specific changes
> > needed to initramfs-handling?
> > For Debian you are welcome to include below Link [1].
> > Not sure I will send/ask to/on the debian-kernel mailing list in this topic.
> 
> I don’t expect any distro specific changes are required to continue operating
> as-is. However, if a distro wanted to switch to a zstd compressed initramfs 
> they would need to update their toolchain to compress with zstd.

Just setting COMPRESS=zstd is enough -- it'll say:
W: Unknown compression command zstd
but will do everything right.

Also, just minutes ago someone filed https://bugs.debian.org/955469


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁ in the beginning was the boot and root floppies and they were good.
⢿⡄⠘⠷⠚⠋⠀                                       -- <willmore> on #linux-sunxi
⠈⠳⣄⠀⠀⠀⠀
