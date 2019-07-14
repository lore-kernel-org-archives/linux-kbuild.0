Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:56025 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfGNHtd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jul 2019 03:49:33 -0400
Subject: Re: [PATCH v4] builddeb: generate multi-arch friendly linux-libc-dev
 package
References: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
 <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com>
 <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
 <CAK7LNAQDkPSzA3A6DDYvg3QLHWrkAs8-iWDp44opqtmW10QVvQ@mail.gmail.com>
From: Cedric Hombourger <cedric_hombourger@mentor.com>
Message-ID: <39577168-2943-1be0-dffc-be9917ff70e0@mentor.com>
Date: Sun, 14 Jul 2019 09:49:19 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQDkPSzA3A6DDYvg3QLHWrkAs8-iWDp44opqtmW10QVvQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, isar-users@googlegroups.com, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>


On 7/11/2019 4:46 PM, Masahiro Yamada wrote:
> On Tue, Jul 9, 2019 at 4:44 PM Cedric Hombourger
> <Cedric_Hombourger@mentor.com> wrote:
>> Debian-based distributions place libc header files in a machine
>> specific directory (/usr/include/<libc-machine>) instead of
>> /usr/include/asm to support installation of the linux-libc-dev
>> package from multiple architectures. Move headers installed by
>> "make headers_install" accordingly using Debian's tuple from
>> dpkg-architecture (stored in debian/arch).
>>
>> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
>> ---
>>   scripts/package/builddeb | 5 +++++
>>   scripts/package/mkdebian | 1 +
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index b03dd56a4782..d5d33bcba1fb 100755
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -132,6 +132,11 @@ fi
>>   if [ "$ARCH" != "um" ]; then
>>          $MAKE -f $srctree/Makefile headers_check
>>          $MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
>> +       # move asm headers to /usr/include/<libc-machine>/asm to match the structure
>> +       # used by Debian-based distros (to support multi-arch)
>> +       host_arch=$(dpkg-architecture -a$(cat debian/arch) -qDEB_HOST_MULTIARCH)
>> +       mkdir $libc_headers_dir/usr/include/$host_arch
>> +       mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$host_arch/
>>   fi
>
> I just wondered whether there is something better than $(cat debian/arch),
> but maybe not.
>
> OK, I am ready to pick it up for 5.3-rc1.
>
> With Ben's Ack, I would be able to proceed with more confident.

Great thank you. Let me know if I can help clear any remaining concerns 
you may have

>
>
>
>
>>   # Install the maintainer scripts
>> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
>> index 8351584cb24e..e0750b70453f 100755
>> --- a/scripts/package/mkdebian
>> +++ b/scripts/package/mkdebian
>> @@ -197,6 +197,7 @@ Architecture: $debarch
>>   Description: Linux support headers for userspace development
>>    This package provides userspaces headers from the Linux kernel.  These headers
>>    are used by the installed headers for GNU glibc and other system libraries.
>> +Multi-Arch: same
>>
>>   Package: $dbg_packagename
>>   Section: debug
>> --
>> 2.11.0
>>
>
