Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35733 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752547AbcLMNKB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Dec 2016 08:10:01 -0500
Received: by mail-wm0-f52.google.com with SMTP id a197so108956800wmd.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Dec 2016 05:10:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160916114122.9A6D06C8018C@dd34104.kasserver.com>
References: <1473967528-1844-1-git-send-email-riku.voipio@linaro.org>
 <20160915194803.6350D6C802C4@dd34104.kasserver.com> <CAAqcGHm9WYbVKRiz4YQXZu5Jn5DJgNii1ubvxX1o1C9C14GgFA@mail.gmail.com>
 <20160916114122.9A6D06C8018C@dd34104.kasserver.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Tue, 13 Dec 2016 15:09:58 +0200
Message-ID: <CAAqcGH=BJM4czCh_DzLCa+VFVAVdxKxqztHxpNYL0Tt4im6iYw@mail.gmail.com>
Subject: Re: [PATCH v2] builddeb: Update a few outdated and hardcoded strings
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Timo Sigurdsson <public_timo.s@silentcreek.de>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>

Hi

On 16 September 2016 at 14:41, Timo Sigurdsson
<public_timo.s@silentcreek.de> wrote:
>> On 15 September 2016 at 22:48, Timo Sigurdsson
>> <public_timo.s@silentcreek.de> wrote:
>>> Hi,
>>>
>>> riku.voipio@linaro.org schrieb am 15.09.2016 21:25:
>>>
>>>> From: Riku Voipio <riku.voipio@linaro.org>
>>>>
>>>> The builddeb script has some hardcoded references to Linux version 2.6
>>>> which is ancient. Drop Provides as the virtual packages provided are not
>>>> useful anymore. Leave the Provides for linux-kernel-headers, as someone
>>>> might still be referring to it.
>>>
>>> Looking at your patch, it seems you missed the linux-headers part ...
>>
>> linux-kernel-headers != linux-headers. linux-kernel-headers is
>> provided by linux-libc-dev and actually used to be an package. Since I
>> don't touch what linux-libc-dev provides, it doesnt' appear in this
>> patch.
>
> Ooops. I see... Sorry for the noise!

Did this patch miss the 4.10 window?

Riku

>>>> While at it, updated copyright date and standards version.
>>>>
>>>> Cc: Timo Sigurdsson <public_timo.s@silentcreek.de>
>>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>>> ---
>>>> scripts/package/builddeb | 8 ++------
>>>> 1 file changed, 2 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>>>> index 8ea9fd2..a7f8b99 100755
>>>> --- a/scripts/package/builddeb
>>>> +++ b/scripts/package/builddeb
>>>> @@ -265,7 +265,7 @@ This is a packacked upstream version of the Linux kernel.
>>>> The sources may be found at most Linux ftp sites, including:
>>>> ftp://ftp.kernel.org/pub/linux/kernel
>>>>
>>>> -Copyright: 1991 - 2015 Linus Torvalds and others.
>>>> +Copyright: 1991 - 2016 Linus Torvalds and others.
>>>>
>>>> The git repository for mainline kernel development is at:
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>> @@ -288,7 +288,7 @@ Section: kernel
>>>> Priority: optional
>>>> Maintainer: $maintainer
>>>> Build-Depends: $build_depends
>>>> -Standards-Version: 3.8.4
>>>> +Standards-Version: 3.9.8
>>>> Homepage: http://www.kernel.org/
>>>> EOF
>>>>
>>>> @@ -296,7 +296,6 @@ if [ "$ARCH" = "um" ]; then
>>>>       cat <<EOF >> debian/control
>>>>
>>>> Package: $packagename
>>>> -Provides: linux-image, linux-image-2.6, linux-modules-$version
>>>> Architecture: any
>>>> Description: User Mode Linux kernel, version $version
>>>>  User-mode Linux is a port of the Linux kernel to its own system call
>>>> @@ -313,7 +312,6 @@ else
>>>>       cat <<EOF >> debian/control
>>>>
>>>> Package: $packagename
>>>> -Provides: linux-image, linux-image-2.6, linux-modules-$version
>>>> Suggests: $fwpackagename
>>>> Architecture: any
>>>> Description: Linux kernel, version $version
>>>> @@ -346,7 +344,6 @@ rm -f "$objtree/debian/hdrsrcfiles"
>>>> "$objtree/debian/hdrobjfiles"
>>>> cat <<EOF >> debian/control
>>>>
>>>> Package: $kernel_headers_packagename
>>>> -Provides: linux-headers, linux-headers-2.6
>>>
>>> I guess, here you wanted to have:
>>> +Provides: linux-headers
>>
>> linux-headers is virtual package that hasn't been provided by official
>> packages for a while. So this is intentional.
>>
>>>> Architecture: any
>>>> Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
>>>>  This package provides kernel header files for $KERNELRELEASE on
>>>>  \${kernel:debarch}
>>>> @@ -404,7 +401,6 @@ if [ -n "$BUILD_DEBUG" ] ; then
>>>>
>>>> Package: $dbg_packagename
>>>> Section: debug
>>>> -Provides: linux-debug, linux-debug-$version
>>>> Architecture: any
>>>> Description: Linux kernel debugging symbols for $version
>>>>  This package will come in handy if you need to debug the kernel. It provides
>>>> --
>>>> 2.1.4
>
> Regards,
>
> Timo
>
