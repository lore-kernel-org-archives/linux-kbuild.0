Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:63914 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751500AbdINLYJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Sep 2017 07:24:09 -0400
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com [209.85.161.181]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v8EBNorh026177
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Sep 2017 20:23:51 +0900
Received: by mail-yw0-f181.google.com with SMTP id w9so28395ywi.11
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Sep 2017 04:23:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHmSdO_xorBEUnGiG6VuY4VOQd4jfLzKSNQ=DUb1wK-Nww@mail.gmail.com>
References: <20170816110855.6021-1-riku.voipio@linaro.org> <CAK7LNASm98uy4vC7c3UxM10fx422jHwg+QUmadcpc+_TvECqew@mail.gmail.com>
 <CAK7LNARdpaJ6q16_XXqkuAC-fP1X=gZQn3Z31dftab702HcUGw@mail.gmail.com> <CAAqcGHmSdO_xorBEUnGiG6VuY4VOQd4jfLzKSNQ=DUb1wK-Nww@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Sep 2017 20:23:09 +0900
Message-ID: <CAK7LNAT1B59U6y8Z4uV7F-M4VVkSKgjdPuTgJ+SUTaykdWredw@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/package/Makefile: make revision update a function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>

2017-09-11 19:48 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
> On 8 September 2017 at 18:40, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> 2017-09-08 2:04 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>>> Hi Riku,
>>>
>>>
>>> 2017-08-16 20:08 GMT+09:00  <riku.voipio@linaro.org>:
>>>> From: Riku Voipio <riku.voipio@linaro.org>
>>>>
>>>> The updated deb-pkg and bindeb-pkg will use the same snippet,
>>>> so make it reusable.
>>>>
>>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>>> ---
>>>>  scripts/package/Makefile | 12 +++++++-----
>>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>>>> index 71b4a8af9d4d..9867638896ad 100644
>>>> --- a/scripts/package/Makefile
>>>> +++ b/scripts/package/Makefile
>>>> @@ -44,14 +44,18 @@ tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>>>>         $(addprefix $(2)/,$(TAR_CONTENT) $(3)); \
>>>>  rm -f $(2) $(objtree)/.scmversion
>>>>
>>>> +quiet_cmd_updateversion = UPDATEVERSION
>>>> +      cmd_updateversion = \
>>>> +       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version; \
>>>> +       mv -f $(objtree)/.tmp_version $(objtree)/.version
>>>> +
>>>>  # rpm-pkg
>>>>  # ---------------------------------------------------------------------------
>>>>  rpm-pkg rpm: FORCE
>>>>         $(MAKE) clean
>>>>         $(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
>>>>         $(call cmd,src_tar,$(KERNELPATH),kernel.spec)
>>>> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
>>>> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
>>>> +       $(call cmd,updateversion)
>>>>         rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
>>>>         rm $(KERNELPATH).tar.gz kernel.spec
>>>>
>>>> @@ -60,9 +64,7 @@ rpm-pkg rpm: FORCE
>>>>  binrpm-pkg: FORCE
>>>>         $(MAKE) KBUILD_SRC=
>>>>         $(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
>>>> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
>>>> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
>>>> -
>>>> +       $(call cmd,updateversion)
>>>>         rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
>>>>                 $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>>>>         rm binkernel.spec
>>>
>>>
>>>
>>> scripts/mkversion is pretty small.
>>> I think scripts/mkversion can also update .version
>>>
>>> For example,
>>>
>>>
>>>
>>>
>>> if [ ! -f .version ]
>>> then
>>>     version=1
>>> else
>>>     version=$(expr 0$(cat .version) + 1)
>>> fi
>>>
>>> echo $version > .version
>>> echo $version
>>>
>>>
>>>
>>>
>>> Then, remove the duplicated code from the Makefile.
>>
>>
>>
>> Sorry, please let me think about this carefully.
>>
>> We have simliar code in
>> scripts/link-vmlinux.sh and scripts/mkversion
>
> Oh. Looking deeper, running "make binrpm" twice in a row incrediments
> the .version with two. I think we can leave updating version to
> link-mklinux and drop updating .version from
> scripts/packaging/Makefile. The actual use of mkversion is then to
> predict the next version, and we can stop using .version directly in
> builddeb since the build will outdate it.
>

Even worse, the spec file claims a different number from
the one embedded in the kernel image
(for both rpm-pkg and binrpm-pkg).

I sent a patch.  Seems working as far as I tested.





-- 
Best Regards
Masahiro Yamada
