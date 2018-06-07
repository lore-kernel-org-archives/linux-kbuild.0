Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:39996 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932100AbeFGLHf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 07:07:35 -0400
Received: by mail-pl0-f66.google.com with SMTP id t12-v6so5912489plo.7
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jun 2018 04:07:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1a021bf3-cf93-aa12-c5a8-1ea6c7900fbb@iogearbox.net>
References: <20180413090351.25662-1-anders.roxell@linaro.org>
 <20180514115809.9803-1-anders.roxell@linaro.org> <1a021bf3-cf93-aa12-c5a8-1ea6c7900fbb@iogearbox.net>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 7 Jun 2018 13:07:33 +0200
Message-ID: <CADYN=9LR5rqf_2vqW0jKixZpnvtM_XyOwJuvXX4hgMwGkD-QoA@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: add headers_install to lib.mk
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Shuah Khan <shuah@kernel.org>, Bamvor Zhang <bamv2005@gmail.com>, brgl@bgdev.pl, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, aarcange@redhat.com, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, Networking <netdev@vger.kernel.org>, alexei.starovoitov@gmail.com

On 14 May 2018 at 21:20, Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 05/14/2018 01:58 PM, Anders Roxell wrote:
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
>>  Makefile                                          | 14 +-------------
>>  scripts/subarch.include                           | 13 +++++++++++++
>>  tools/testing/selftests/android/Makefile          |  2 +-
>>  tools/testing/selftests/android/ion/Makefile      |  1 +
>>  tools/testing/selftests/bpf/Makefile              |  5 ++---
>>  tools/testing/selftests/futex/functional/Makefile |  1 +
>>  tools/testing/selftests/gpio/Makefile             |  7 ++-----
>>  tools/testing/selftests/kvm/Makefile              |  7 ++-----
>>  tools/testing/selftests/lib.mk                    | 10 ++++++++++
>>  tools/testing/selftests/vm/Makefile               |  4 ----
>>  10 files changed, 33 insertions(+), 31 deletions(-)
>>  create mode 100644 scripts/subarch.include
> [...]
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
>> index 438d4f93875b..9741609a0eb1 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -16,9 +16,8 @@ LDLIBS += -lcap -lelf -lrt -lpthread
>>  TEST_CUSTOM_PROGS = $(OUTPUT)/urandom_read
>>  all: $(TEST_CUSTOM_PROGS)
>>
>> -$(TEST_CUSTOM_PROGS): urandom_read
>> -
>> -urandom_read: urandom_read.c
>> +$(TEST_CUSTOM_PROGS):| khdr
>> +$(TEST_CUSTOM_PROGS): urandom_read.c
>>       $(CC) -o $(TEST_CUSTOM_PROGS) -static $<
>>
>>  # Order correspond to 'make run_tests' order
>
> Can you elaborate on the error in BPF you're seeing that would force a
> headers_install for it?

BPF shouldn't be affected, a new revision of the patch does not touch
the bpf/Makefile.
I will send out a patch soon.

Cheers,
Anders

> Some people are running the tools/ infrastructure
> (incl. BPF kselftests) outside of kernel tree where this dependency would
> break their setup. Why BPF bits cannot be fixed otherwise?
>
> Thanks,
> Daniel
