Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lekensteyn.nl ([178.21.112.251]:43675 "EHLO lekensteyn.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934208AbcJ0RDO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Oct 2016 13:03:14 -0400
Date: Thu, 27 Oct 2016 17:42:02 +0200
From: Peter Wu <peter@lekensteyn.nl>
Subject: Re: 'kbuild' merge before 4.9-rc1 breaks build and boot
Message-ID: <20161027154202.GE27017@al>
References: <4c04b846-3da8-dc42-4fa6-30f72a5c2437@hartkopp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c04b846-3da8-dc42-4fa6-30f72a5c2437@hartkopp.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Oliver Hartkopp <socketcan@hartkopp.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hey Al, Michal,

I can confirm Olivers issue, the current mainline kernel fails to boot
on kernels with CONFIG_MODVERSIONS=y. Bisection points to:

    commit 784d5699eddc55878627da20d3fe0c8542e2f1a2
    Author: Al Viro <viro@zeniv.linux.org.uk>
    Date:   Mon Jan 11 11:04:34 2016 -0500

        x86: move exports to actual definitions

        Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Good builds have a non-zero address in Module.symvers:

    0x69acdf38      memcpy  vmlinux EXPORT_SYMBOL

Bad builds have a zero address here:

    0x00000000      memcpy  vmlinux EXPORT_SYMBOL

This was encountered on Arch Linux with GCC 6.2.1 and
Linux v4.9-rc2-40-g9fe68ca. Note that the identified commit above cannot
be reverted cleanly on master.

Kind regards,
Peter

On Fri, Oct 21, 2016 at 06:23:57PM +0200, Oliver Hartkopp wrote:
> Hello Michal,
> 
> I waited some days for a fix - but obviously no one else has this problem so
> far ...
> 
> This merge
> 
> "Merge branch 'kbuild' of
> git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild"
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=84d69848c97faab0c25aa2667b273404d2e2a64a
> 
> creates a bunch of warnings on my system and the built kernel does not boot
> (it complains about a missing root fs).
> 
> In the build process some .ko files are built fine and some don't:
> 
> (..)
>   MODPOST 176 modules
>   AS      arch/x86/boot/compressed/efi_thunk_64.o
>   GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
>   CC      arch/x86/boot/compressed/misc.o
> WARNING: "memset" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> WARNING: "__fentry__" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> WARNING: "memcpy" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> WARNING: "__sw_hweight32" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> WARNING: "_copy_to_user" [sound/usb/snd-usb-audio.ko] has no CRC!
> WARNING: "memset" [sound/usb/snd-usb-audio.ko] has no CRC!
> WARNING: "__put_user_1" [sound/usb/snd-usb-audio.ko] has no CRC!
> WARNING: "__put_user_4" [sound/usb/snd-usb-audio.ko] has no CRC!
> WARNING: "__fentry__" [sound/usb/snd-usb-audio.ko] has no CRC!
> WARNING: "memcpy" [sound/usb/snd-usb-audio.ko] has no CRC!
> WARNING: "__fentry__" [sound/soundcore.ko] has no CRC!
> (..)
> WARNING: "__fentry__" [arch/x86/crypto/crc32c-intel.ko] has no CRC!
> WARNING: "__fentry__" [arch/x86/crypto/crc32-pclmul.ko] has no CRC!
> WARNING: "__fentry__" [arch/x86/crypto/aesni-intel.ko] has no CRC!
> WARNING: "__fentry__" [arch/x86/crypto/aes-x86_64.ko] has no CRC!
>   CC      arch/x86/crypto/aes-x86_64.mod.o
>   CC      arch/x86/crypto/aesni-intel.mod.o
>   CC      arch/x86/crypto/crc32-pclmul.mod.o
>   CC      arch/x86/crypto/crc32c-intel.mod.o
> (..)
> 
> When reverting the entire pull with
> 
> git diff 84d69848c97faab0c25aa2667b273404d2e2a64a
> d4d24d2d0a7ea3b62efd7336bfc2344e29b36bc5 | patch -p1
> 
> everything is ok again.
> 
> My system is a Debian Stretch.
> gcc version 6.2.0 20161010 (Debian 6.2.0-6)
> 
> ..config is attached - in the case I have an unusual one from your
> perspective.
> 
> Regards,
> Oliver
