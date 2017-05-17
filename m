Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49872 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754606AbdEQRWh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2017 13:22:37 -0400
MIME-Version: 1.0
In-Reply-To: <05860fa0-2186-8e02-5733-0f7528d9262f@6wind.com>
References: <1494911703-16619-1-git-send-email-yamada.masahiro@socionext.com> <05860fa0-2186-8e02-5733-0f7528d9262f@6wind.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 May 2017 02:22:07 +0900
Message-ID: <CAK7LNATEMqPO1L0217TK4dcqqcdn76tzqDXxJJvnGi+1KyD7ow@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: skip install/check of headers right under uapi directories
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-05-16 16:40 GMT+09:00 Nicolas Dichtel <nicolas.dichtel@6wind.com>:
> Le 16/05/2017 =C3=A0 07:15, Masahiro Yamada a =C3=A9crit :
>> Since commit 61562f981e92 ("uapi: export all arch specifics
>> directories"), "make INSTALL_HDR_PATH=3D$root/usr headers_install"
>> deletes standard glibc headers and others in $root/usr/include.
>>
>> The cause of the issue is that headers_install now starts descending
>> from arch/$(hdr-arch)/include/uapi with $root/usr/include for its
>> destination when installing asm headers.  So, headers already there
>> are assumed to be unwanted.
>>
>> When headers_install starts descending from include/uapi with
>> $root/usr/include for its destination, it works around the problem
>> by creating an dummy destination $root/usr/include/uapi, but this
>> is tricky.
>>
>> To fix the problem in a clean way is to skip headers install/check
>> in include/uapi or arch/$(hdr-arch)/include/uapi because we know
>> there are only sub-directories in uapi directories.  A good side
>> effect is the empty destination $root/usr/include/uapi will go
>> away.
>>
>> I am also removing the trailing slash in the headers_check target to
>> skip checking in arch/$(hdr-arch)/include/uapi.
>>
>> Fixes: 61562f981e92 ("uapi: export all arch specifics directories")
>> Reported-by: Dan Williams <dan.j.williams@intel.com>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Thank you for the patch.
>
> Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>


Applied to linux-kbuild/fixes.



--=20
Best Regards
Masahiro Yamada
