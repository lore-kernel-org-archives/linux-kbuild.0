Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47109 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbdINOcX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Sep 2017 10:32:23 -0400
MIME-Version: 1.0
In-Reply-To: <CAAqcGHmG3u9667nLsBH+dG-wBXP1fvPwZ0ZDZ+2yBYNWosv1Gw@mail.gmail.com>
References: <1505388366-4192-1-git-send-email-yamada.masahiro@socionext.com> <CAAqcGHmG3u9667nLsBH+dG-wBXP1fvPwZ0ZDZ+2yBYNWosv1Gw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Sep 2017 23:31:21 +0900
Message-ID: <CAK7LNARwQ6bwtL6DQGEGhCpYXCcJRpwpKC3hCM=CKOWY6=zAXA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: (bin)rpm-pkg: fix version number handling
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>

Hi Riku.

2017-09-14 22:10 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
> On 14 September 2017 at 14:26, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> The "Release:" field of the spec file is determined based on the
>> .version file.
>>
>> However, the .version file is not copied to the source tar file.
>> So, when we build the kernel from the source package, the UTS_VERSION
>> always indicates #1.  This does not match with "rpm -q".
>>
>> The kernel UTS_VERSION and "rpm -q" do not agree for binrpm-pkg, either.
>> Please note the kernel has already been built before the spec file is
>> created.  Currently, mkspec invokes mkversion.  This script returns an
>> incremented version.  So, the "Release:" field of the spec file is
>> greater than the version in the kernel by one.
>>
>> For the source package build (where .version file is missing), we can
>> give KBUILD_BUILD_VERSION=%{release} to the build command.
>>
>> For the binary package build, we can simply read out the .version file
>> because it contains the version number that was used for building the
>> kernel image.
>>
>> We can remove scripts/mkversion because scripts/package/Makefile need
>> not touch the .version file.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v2:
>>   - Remove bogus comment in mkspec
>>
>>  scripts/mkversion        | 6 ------
>>  scripts/package/Makefile | 5 -----
>>  scripts/package/mkspec   | 6 ++----
>>  3 files changed, 2 insertions(+), 15 deletions(-)
>>  delete mode 100644 scripts/mkversion
>>
>> diff --git a/scripts/mkversion b/scripts/mkversion
>> deleted file mode 100644
>> index c12addc..0000000
>> --- a/scripts/mkversion
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -if [ ! -f .version ]
>> -then
>> -    echo 1
>> -else
>> -    expr 0`cat .version` + 1
>> -fi
>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>> index 71b4a8a..73f9f31 100644
>> --- a/scripts/package/Makefile
>> +++ b/scripts/package/Makefile
>> @@ -50,8 +50,6 @@ rpm-pkg rpm: FORCE
>>         $(MAKE) clean
>>         $(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
>>         $(call cmd,src_tar,$(KERNELPATH),kernel.spec)
>> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
>> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
>>         rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
>>         rm $(KERNELPATH).tar.gz kernel.spec
>>
>> @@ -60,9 +58,6 @@ rpm-pkg rpm: FORCE
>>  binrpm-pkg: FORCE
>>         $(MAKE) KBUILD_SRC=
>>         $(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
>> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
>> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
>> -
>>         rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
>>                 $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>>         rm binkernel.spec
>> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
>> index bb43f15..e81dafc 100755
>> --- a/scripts/package/mkspec
>> +++ b/scripts/package/mkspec
>> @@ -27,9 +27,7 @@ __KERNELRELEASE=`echo $KERNELRELEASE | sed -e "s/-/_/g"`
>>  echo "Name: kernel"
>>  echo "Summary: The Linux Kernel"
>>  echo "Version: $__KERNELRELEASE"
>> -# we need to determine the NEXT version number so that uname and
>> -# rpm -q will agree
>> -echo "Release: `. $srctree/scripts/mkversion`"
>> +echo "Release: $(cat .version)"
>
> $(cat .version||echo 1)"
>
>  .version might not exist at that point  - for example when calling
> make rpm-pkg from a pristine source tree. Apart from that looks good
> to me.
>

Good catch.  I will fix it.  Thanks!


-- 
Best Regards
Masahiro Yamada
