Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:52085 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756145Ab3ETNes (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 May 2013 09:34:48 -0400
Received: by mail-ie0-f181.google.com with SMTP id x12so13860095ief.12
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2013 06:34:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1367982881.4131.163.camel@deadeye.wl.decadent.org.uk>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
 <1367941611-12223-3-git-send-email-anisse@astier.eu> <1367982881.4131.163.camel@deadeye.wl.decadent.org.uk>
From: Anisse Astier <anisse@astier.eu>
Date: Mon, 20 May 2013 15:34:28 +0200
Message-ID: <CALUN=qLaDcCxTduMRomP5KHH7zEuvRza2tnVgpVJi5GWP6b6KA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] deb-pkg: split debug symbols in their own package
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com

Hi Ben,

On Wed, May 8, 2013 at 5:14 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Tue, 2013-05-07 at 17:46 +0200, Anisse Astier wrote:
>> This can reduce almost 3 times the size of the linux-image package,
>> while keeping the debug symbols available for this particular build, in
>> their own package.
>>
>> This mimics the way kernels are built in debian, ubuntu, or with
>> make-kpkg, and comes at the price of a small slowdown in the building of
>> packages.
>>
>> Signed-off-by: Anisse Astier <anisse@astier.eu>
>> ---
>>  scripts/package/builddeb | 43 ++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index 2d84671..797484b 100644
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -78,17 +78,21 @@ tmpdir="$objtree/debian/tmp"
>>  fwdir="$objtree/debian/fwtmp"
>>  kernel_headers_dir="$objtree/debian/hdrtmp"
>>  libc_headers_dir="$objtree/debian/headertmp"
>> +dbg_dir="$objtree/debian/dbgtmp"
>>  packagename=linux-image-$version
>>  fwpackagename=linux-firmware-image
>>  kernel_headers_packagename=linux-headers-$version
>>  libc_headers_packagename=linux-libc-dev
>> +dbg_packagename=$packagename-dbg
>>
>>  if [ "$ARCH" = "um" ] ; then
>>       packagename=user-mode-linux-$version
>>  fi
>>
>> +BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $objtree/$KCONFIG_CONFIG || true)"
>
> As in the previous patch, you can omit $objtree/ here.
>
> [...]
>> @@ -128,6 +136,20 @@ if grep -q '^CONFIG_MODULES=y' $objtree/$KCONFIG_CONFIG ; then
>>               mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$version/"
>>               rmdir "$tmpdir/lib/modules/$version"
>>       fi
>> +     if [ -n "$BUILD_DEBUG" ] ; then
>> +             (
>> +                     cd $tmpdir
>> +                     for module in $(find lib/modules/ -name *.ko); do
>
> What if this is a non-modular kernel?

It's not entirely apparent in the diff, but this code is inside an if
checking CONFIG_MODULES..

>
> [...]
>> +if [ -n "$BUILD_DEBUG" ] ; then
>> +     # Build debug package
>> +     mkdir -p $dbg_dir/usr/lib/debug/lib/modules/$version/
>> +     cp vmlinux $dbg_dir/usr/lib/debug/lib/modules/$version/
> [...]
>
> Different tools have different ideas about where vmlinux debuginfo
> should be.  What I ended up doing in Debian's own kernel debug packages
> in wheezy was installing/symlinking to all of:
>
> /usr/lib/debug/boot/vmlinux-$version        [systemtap]
> /usr/lib/debug/lib/modules/$version/vmlinux [perf]
> /usr/lib/debug/vmlinux-$version             [kdump-tools]
>
> So unless anyone has a better suggestion I think you'd better do the
> same here.
>
> (But really, the Linux development community ought to agree on a single
> canonical path format that all such tools will support.)

I'll add the symlinks for the next iteration.

Thanks a lot for your review time.

Anisse
