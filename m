Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:37504 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727510AbfIZWLj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Sep 2019 18:11:39 -0400
Received: by mail-io1-f68.google.com with SMTP id b19so10750369iob.4
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2019 15:11:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] selftests: Add kselftest_install target to main
 Makefile
References: <cover.1569452305.git.skhan@linuxfoundation.org>
 <b3c50f4c726df521039f57295b53349227f629d9.1569452305.git.skhan@linuxfoundation.org>
 <CAK7LNATCFF9ERTwtPnnbMLGv++NJ_5zXxB0=NWHdSGrYADj3ug@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <43a7962e-4fae-78e4-1db2-b75c7ff802b1@linuxfoundation.org>
Date: Thu, 26 Sep 2019 16:11:36 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNATCFF9ERTwtPnnbMLGv++NJ_5zXxB0=NWHdSGrYADj3ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, "Cc: Shuah Khan" <shuah@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "skh >> Shuah Khan" <skhan@linuxfoundation.org>

On 9/25/19 9:24 PM, Masahiro Yamada wrote:
> Hi Shuah,
> 
> 
> 
> On Thu, Sep 26, 2019 at 8:05 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> Add kselftest_install target to install tests from the top level
>> Makefile. This is to simplify kselftest use-cases for CI and
>> distributions where build and test systems are different.
>>
>> This change addresses requests from developers and testers to add
>> support for installing kselftest from the main Makefile.
>>
>> In addition, make the install directory the same when install is
>> run using "make kselftest_install" or by running kselftest_install.sh.
>> Also fix the INSTALL_PATH variable conflict between main Makefile.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> So, if these two patches were applied, we would see the following:
> 
> 
> PHONY += kselftest_build
> kselftest_build:
>          $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests all
> 
> PHONY += kselftest
> kselftest:
>          $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> 
> PHONY += kselftest_install
> kselftest_install:
>          $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests install
> 
> PHONY += kselftest-clean
> kselftest-clean:
>          $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean
> 
> 
> I do not want to see this endless crap addition just for
> changing the working directory to $(srctree)/tools/testing/selftests
> 
> 
> 
> Why don't you use pattern rule?
> Those will be reduced into the two rules.
> 

I just didn't think about simplifying it. Thanks for
being direct.

> 
> 
> PHONY += kselftest
> kselftest:
>          $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> 
> kselftest-%: FORCE
>          $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
> 
> 
> 
> This also avoids your inconsistency about
> "kselftest-" vs "kselftest_".
> 
> 
> Given the existing "kselftest-clean" and "kselftest-merge",
> "kselftest_build" and "kselftest_install"
> (using an underscore instead of n hyphen)
> would add needless confusion.
> 
> 

Done. Sending v2 with two patches collapsed into one.

thanks,
-- Shuah
