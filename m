Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:36329 "EHLO
	mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbcAZX3Q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jan 2016 18:29:16 -0500
Received: by mail-vk0-f41.google.com with SMTP id n1so101400411vkb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jan 2016 15:29:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160126134214.GN10826@n2100.arm.linux.org.uk>
References: <1453810236-2082-1-git-send-email-rogershimizu@gmail.com> <20160126134214.GN10826@n2100.arm.linux.org.uk>
From: Roger Shimizu <rogershimizu@gmail.com>
Date: Wed, 27 Jan 2016 08:28:36 +0900
Message-ID: <CAEQ9gEmKO9wvp8DMBO8f4dLtxz2DQU-K-am5o0kcYn6uTKF0qw@mail.gmail.com>
Subject: Re: [RFC] scripts: make extract-vmlinux support ARM vmlinuz
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michal Marek <mmarek@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2016 at 10:42 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Jan 26, 2016 at 09:10:36PM +0900, Roger Shimizu wrote:
>> vmlinuz on ARM seems is not an ELF, so scripts/extract-vmlinux
>> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
>> index 5061abcc2540..d569eb8c8efe 100755
>> --- a/scripts/extract-vmlinux
>> +++ b/scripts/extract-vmlinux
>> @@ -15,7 +15,15 @@ check_vmlinux()
>>       # Use readelf to check if it's a valid ELF
>>       # TODO: find a better to way to check that it's really vmlinux
>>       #       and not just an elf
>> -     readelf -h $1 > /dev/null 2>&1 || return 1
>> +     case "$2" in
>> +     0|"")
>> +             readelf -h $1 > /dev/null 2>&1 || return 1
>> +             ;;
>> +     1|*)
>> +     # For ARCH like ARM, vmlinux is not ELF, so we only do the check
>> +     # when $2 is 0 or NULL
>
> This comment seems to be misleading - I think you mean "vmlinuz" there,
> or maybe "zImage" as the file is named in the kernel build tree to make
> it clear what you're referring to.  "vmlinuz" is the name chosen by
> distro installers.

I just add these comment following original comment above.
And even the script name is "extract-vmlinux".

In the check_vmlinux() routine, the target of the check is
decompressed result of
parsed part zImage file.
I guess the original comment is true, it's called vmlinux in kernel build tree.

I hope you can comment:
- whether my hack work for all ARMs (armel/armhf/arm64 etc). I only
tested armel.
- whether there's better way to check ARM's vmlinux

Thank you!

Cheers,
Roger
-- 
Roger Shimizu, GMT +9 Tokyo
PGP/GPG: 17B3ACB1
