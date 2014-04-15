Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:58621 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988AbaDOFCH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Apr 2014 01:02:07 -0400
Received: by mail-la0-f53.google.com with SMTP id b8so6351002lan.26
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2014 22:02:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1397505357.31481.24.camel@deadeye.wl.decadent.org.uk>
References: <1397322931-16688-1-git-send-email-fathi.boudra@linaro.org>
	<1397505357.31481.24.camel@deadeye.wl.decadent.org.uk>
Date: Tue, 15 Apr 2014 08:02:05 +0300
Message-ID: <CAGNsrLCjsF+PipsREXX5kziZRJrGh8qGwQfD6ZXR+Buew14nWA@mail.gmail.com>
Subject: Re: [PATCH] deb-pkg: install device tree blobs in linux-image package
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>

On 14 April 2014 22:55, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Sat, 2014-04-12 at 20:15 +0300, Fathi Boudra wrote:
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  scripts/package/builddeb | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index f46e4dd..24cb3b1 100644
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -165,6 +165,11 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>>       fi
>>  fi
>>
>> +if grep -q '^CONFIG_OF=y' $KCONFIG_CONFIG ; then
>> +     mkdir -p "$tmpdir/boot/dtb/$version"
>
> The boot loader only needs to read at most one of the installed DTB
> files on any given system, and you can't in general expect it to read a
> DTB from the filesystem.  So why not install them in
> /usr/lib/linux-image-$version where flash-kernel expects?

From various discussions, I think it's agreed that /usr/lib/... isn't
the right path to use (and we use it since years in Linaro images
unfortunately).
The consensus seems to follow bootloader spec:
http://www.freedesktop.org/wiki/Specifications/BootLoaderSpec/
and install the DTBs under /boot. Get it versioned is preferable.
It should address the various bootloaders (U-boot, UEFI, GRUB,
barebox, etc...) requirements, except the VFAT file system.

IMO we should support the distribution wide consensus in this case,
instead of flash-kernel (Debian/Ubuntu specific tool) expectations.
We'll probably end up by adding a symlink to keep compatibility with
older systems or fix flash-kernel.

Any other feedback on this topic is appreciated.

>> +     INSTALL_DTBS_PATH="$tmpdir/boot/dtb/$version" $MAKE KBUILD_SRC= dtbs_install
>> +fi
>> +
>
> The dtbs_install target is (currently) specific to arm so this appears
> to break other architectures where CONFIG_OF is used.

Right. I'll fix it.

> (But it's good to know that it's there, and we should maybe start using
> it in the Debian official packages.)
>
> Ben.
>
>>  if [ "$ARCH" != "um" ]; then
>>       $MAKE headers_check KBUILD_SRC=
>>       $MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
>
> --
> Ben Hutchings
> I say we take off; nuke the site from orbit.  It's the only way to be sure.

Cheers,
-- 
Fathi Boudra
