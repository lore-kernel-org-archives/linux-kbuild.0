Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34015 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751029AbdIKKsv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Sep 2017 06:48:51 -0400
Received: by mail-lf0-f47.google.com with SMTP id l196so17466988lfl.1
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Sep 2017 03:48:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNARdpaJ6q16_XXqkuAC-fP1X=gZQn3Z31dftab702HcUGw@mail.gmail.com>
References: <20170816110855.6021-1-riku.voipio@linaro.org> <CAK7LNASm98uy4vC7c3UxM10fx422jHwg+QUmadcpc+_TvECqew@mail.gmail.com>
 <CAK7LNARdpaJ6q16_XXqkuAC-fP1X=gZQn3Z31dftab702HcUGw@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Mon, 11 Sep 2017 13:48:49 +0300
Message-ID: <CAAqcGHmSdO_xorBEUnGiG6VuY4VOQd4jfLzKSNQ=DUb1wK-Nww@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/package/Makefile: make revision update a function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>

On 8 September 2017 at 18:40, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-09-08 2:04 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> Hi Riku,
>>
>>
>> 2017-08-16 20:08 GMT+09:00  <riku.voipio@linaro.org>:
>>> From: Riku Voipio <riku.voipio@linaro.org>
>>>
>>> The updated deb-pkg and bindeb-pkg will use the same snippet,
>>> so make it reusable.
>>>
>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>> ---
>>>  scripts/package/Makefile | 12 +++++++-----
>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>>> index 71b4a8af9d4d..9867638896ad 100644
>>> --- a/scripts/package/Makefile
>>> +++ b/scripts/package/Makefile
>>> @@ -44,14 +44,18 @@ tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>>>         $(addprefix $(2)/,$(TAR_CONTENT) $(3)); \
>>>  rm -f $(2) $(objtree)/.scmversion
>>>
>>> +quiet_cmd_updateversion = UPDATEVERSION
>>> +      cmd_updateversion = \
>>> +       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version; \
>>> +       mv -f $(objtree)/.tmp_version $(objtree)/.version
>>> +
>>>  # rpm-pkg
>>>  # ---------------------------------------------------------------------------
>>>  rpm-pkg rpm: FORCE
>>>         $(MAKE) clean
>>>         $(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
>>>         $(call cmd,src_tar,$(KERNELPATH),kernel.spec)
>>> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
>>> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
>>> +       $(call cmd,updateversion)
>>>         rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
>>>         rm $(KERNELPATH).tar.gz kernel.spec
>>>
>>> @@ -60,9 +64,7 @@ rpm-pkg rpm: FORCE
>>>  binrpm-pkg: FORCE
>>>         $(MAKE) KBUILD_SRC=
>>>         $(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
>>> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
>>> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
>>> -
>>> +       $(call cmd,updateversion)
>>>         rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
>>>                 $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>>>         rm binkernel.spec
>>
>>
>>
>> scripts/mkversion is pretty small.
>> I think scripts/mkversion can also update .version
>>
>> For example,
>>
>>
>>
>>
>> if [ ! -f .version ]
>> then
>>     version=1
>> else
>>     version=$(expr 0$(cat .version) + 1)
>> fi
>>
>> echo $version > .version
>> echo $version
>>
>>
>>
>>
>> Then, remove the duplicated code from the Makefile.
>
>
>
> Sorry, please let me think about this carefully.
>
> We have simliar code in
> scripts/link-vmlinux.sh and scripts/mkversion

Oh. Looking deeper, running "make binrpm" twice in a row incrediments
the .version with two. I think we can leave updating version to
link-mklinux and drop updating .version from
scripts/packaging/Makefile. The actual use of mkversion is then to
predict the next version, and we can stop using .version directly in
builddeb since the build will outdate it.

Riku
