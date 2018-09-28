Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout.easymail.ca ([64.68.200.34]:42787 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbeI1UQz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Sep 2018 16:16:55 -0400
Subject: Re: [PATCH v6] selftests: add headers_install to lib.mk
References: <20180809080402.24469-1-anders.roxell@linaro.org>
 <20180904104721.27535-1-anders.roxell@linaro.org>
 <87y3bmte9l.fsf@concordia.ellerman.id.au>
From: Shuah Khan <shuah@kernel.org>
Message-ID: <4473d2b6-a760-1a48-68e7-9f90023b57b5@kernel.org>
Date: Fri, 28 Sep 2018 07:52:26 -0600
MIME-Version: 1.0
In-Reply-To: <87y3bmte9l.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Anders Roxell <anders.roxell@linaro.org>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, bamv2005@gmail.com, brgl@bgdev.pl, pbonzini@redhat.com, akpm@linux-foundation.org, rppt@linux.vnet.ibm.com, aarcange@redhat.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Shuah Khan <shuah@kernel.org>

On 09/27/2018 10:52 PM, Michael Ellerman wrote:
> [ + linuxppc-dev ]
> 
> Anders Roxell <anders.roxell@linaro.org> writes:
>> If the kernel headers aren't installed we can't build all the tests.
>> Add a new make target rule 'khdr' in the file lib.mk to generate the
>> kernel headers and that gets include for every test-dir Makefile that
>> includes lib.mk If the testdir in turn have its own sub-dirs the
>> top_srcdir needs to be set to the linux-rootdir to be able to generate
>> the kernel headers.
>>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>> Reviewed-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>
>> I sent this (v5) a month ago and wondered if it got lost. Resending
>> unchanged.
>>
>> Cheers,
>> Anders
>>
>>  Makefile                                           | 14 +-------------
>>  scripts/subarch.include                            | 13 +++++++++++++
>>  tools/testing/selftests/android/Makefile           |  2 +-
>>  tools/testing/selftests/android/ion/Makefile       |  2 ++
>>  tools/testing/selftests/futex/functional/Makefile  |  1 +
>>  tools/testing/selftests/gpio/Makefile              |  7 ++-----
>>  tools/testing/selftests/kvm/Makefile               |  7 ++-----
>>  tools/testing/selftests/lib.mk                     | 12 ++++++++++++
>>  tools/testing/selftests/net/Makefile               |  1 +
>>  .../selftests/networking/timestamping/Makefile     |  1 +
>>  tools/testing/selftests/vm/Makefile                |  4 ----
>>  11 files changed, 36 insertions(+), 28 deletions(-)
>>  create mode 100644 scripts/subarch.include
> 
> This broke all the powerpc selftests :(

Sorry for thr breakage.

> 
> Why did it go in at rc5?
> 

This patch has been in linux-next for a sometime before I decided to send this.
My original intent was to send this for rc2, and my schedule was messed up with
traveling. Since I didn't hear any issues from linux-next soaking, I made a call
on sending this in for rc5.

On second thought I should have waited until 4.20. Sorry about that.

thanks,
-- Shuah
