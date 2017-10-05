Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18505 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751239AbdJEIGH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 04:06:07 -0400
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com [209.85.216.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v9585tPB018752
        for <linux-kbuild@vger.kernel.org>; Thu, 5 Oct 2017 17:05:55 +0900
Received: by mail-qt0-f169.google.com with SMTP id q4so23859334qtq.8
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Oct 2017 01:05:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHkjNLvjz4X00U0edHp9qBh7=WRJdZ-q6uCihCxb2j0hOA@mail.gmail.com>
References: <20171002104339.4349-1-riku.voipio@linaro.org> <CAK7LNARNU0GYYOU3TkduhTsmgDV+=d84D7AqCcopBw+twyuP7g@mail.gmail.com>
 <CAAqcGHkjNLvjz4X00U0edHp9qBh7=WRJdZ-q6uCihCxb2j0hOA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Oct 2017 17:05:14 +0900
Message-ID: <CAK7LNAS7TtfB1Ohent-QPkcnncyVd92E=3O2sd4ta8TN38qCUA@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

Hi Riku,


2017-10-04 19:38 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
> On 4 October 2017 at 12:12, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Hi Riku,
>
>> 2017-10-02 19:43 GMT+09:00  <riku.voipio@linaro.org>:
>>> From: Riku Voipio <riku.voipio@linaro.org>
>>>
>>> Move debian/ directory generation out of builddeb to a new script,
>>> mkdebian. The package build commands are kept in builddeb, which
>>> is now an internal command called from debian/rules.
>>>
>>> With these changes in place, we can now use dpkg-buildpackage from
>>> deb-pkg and bindeb-pkg removing need for handrolled source/changes
>>> generation.
>>>
>>> This patch is based on the criticism of the current state of builddeb
>>> discussed on:
>>>
>>> https://patchwork.kernel.org/patch/9656403/
>>>
>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>> ---
>>> changes since v2:
>>> - revert back to intdeb-pkg target
>>> - fix parellel builds from deb-pkg targets
>
>> No.  Not fixed.
>
>> I see the same problem for bindeb-pkg as in v2.
>
> The parallel build overload?

Yes.

> I'm totally puzzled then. Debian is still
> stuck with make 4.1, so I guess there is a change in behaviour on
> later makes.


Can you test the patch with GNU Make 4.2 or newer?

You can download tarballs
https://ftp.gnu.org/gnu/make/

The build process is pretty easy,
./configure, make, make install,  as usual.





>> "make deb-pkg" gave me tons of warnings, then finally fails to build:
>
>> rm -rf debian/*tmp debian/files
>> mv debian/ debian.backup # debian/ might be cleaned away
>> make clean
>> mv debian.backup debian
>>  dpkg-source -i.git -b linux
>> dpkg-source: warning: no source format specified in
>> debian/source/format, see dpkg-source(1)
>> dpkg-source: info: using source format '1.0'
>> dpkg-source: warning: source directory 'linux' is not
>> <sourcepackage>-<upstreamversion> 'linux-4.13.0+-4.13.0+'
>> dpkg-source: warning: .orig directory name linux.orig is not
>> <package>-<upstreamversion> (wanted linux-4.13.0+-4.13.0+.orig)
>> dpkg-source: info: building linux-4.13.0+ using existing
>> linux-4.13.0+_4.13.0+.orig.tar.gz
>> dpkg-source: info: building linux-4.13.0+ in linux-4.13.0+_4.13.0+-7.diff.gz
>> dpkg-source: warning: ignoring deletion of file .scmversion, use
>> --include-removal to override
>> dpkg-source: warning: ignoring deletion of directory drivers/lguest
>> dpkg-source: warning: ignoring deletion of file
>> drivers/video/console/fbcon_rotate.h, use --include-removal to
>> override
>> dpkg-source: warning: ignoring deletion of file
>> drivers/video/console/fbcon.h, use --include-removal to override
>> dpkg-source: warning: ignoring deletion of file
>> drivers/video/console/fbcon_cw.c, use --include-removal to override
>> dpkg-source: warning: ignoring deletion of file
>> drivers/video/console/fbcon_rotate.c, use --include-removal to
>> override
>> dpkg-source: warning: ignoring deletion of file
>> drivers/video/console/fbcon.c, use --include-removal to override
>>
>>
>>   ...
>>
>>
>> dpkg-source: info: use the '3.0 (quilt)' format to have separate and
>> documented changes to upstream files, see dpkg-source(1)
>> dpkg-source: error: unrepresentable changes to source
>>
>>
>> Do you have a clue?
>
> It looks like making the tarball (or renaming it) failed, and
> dpkg-source picked up and older orig.tar.gz with same name. I think a
> full log would be useful here, because there probably is bug here in
> my patch.

I saw this build failure some times,
but I cannot reproduce it today.

I have not tracked down the condition it happens under.

I will save the log if it happens next time.





>>> +cat <<EOF > debian/rules
>>> +#!/usr/bin/make -f
>>> +
>>> +build:
>>> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=
>>> +
>>> +binary-arch:
>>> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC= intdeb-pkg
>>> +
>>> +clean:
>>> +       rm -rf debian/*tmp debian/files
>>> +       mv debian/ debian.backup # debian/ might be cleaned away
>>> +       \$(MAKE) clean
>>> +       mv debian.backup debian
>>
>>
>> "mv debian debian.backup" is unnecessary, I think.
>>
>>
>> I think you saw
>>
>> clean-dirs += $(objtree)/debian/
>>
>> in scripts/package/Makefile.
>
>> Please notice this is cleaned-up by "make mrproper"
>> because Kbuild does not descend under scripts/ for "make clean".
>
> That is how it was in the old version of builddeb as well. I'll submit
> another patch to remove the mv-in-clean hack.

Yes, please do so.


-- 
Best Regards
Masahiro Yamada
