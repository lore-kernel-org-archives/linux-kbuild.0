Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17208 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753008AbeGIXRy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 19:17:54 -0400
MIME-Version: 1.0
In-Reply-To: <20180709192134.vhd4lh443fymthfs@treble>
References: <1531043982-13325-1-git-send-email-yamada.masahiro@socionext.com> <20180709192134.vhd4lh443fymthfs@treble>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 10 Jul 2018 08:17:06 +0900
Message-ID: <CAK7LNAR25_zLXmiyEs4N44Pi0qsyPGiuqSUUw-BbtQXyNmh-Og@mail.gmail.com>
Subject: Re: [PATCH] objtool: move libelf detection to Kconfig from Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: X86 ML <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-07-10 4:21 GMT+09:00 Josh Poimboeuf <jpoimboe@redhat.com>:
> On Sun, Jul 08, 2018 at 06:59:42PM +0900, Masahiro Yamada wrote:
>> Currently, users are allowed to enable STACK_VALIDATION regardless
>> of the compiler capability.  The top-level Makefile warns or breaks
>> the build if it turns out that the host compiler cannot link libelf.
>>
>> Move the libelf test to Kconfig so that users can enable the feature
>> only when the host compiler can build the objtool.  The ugly check
>> in the Makefile will go away.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Thanks for cleaning this up!
>
>> I am sure about this patch only from the build system point of view.
>>
>> Please review this from x86 and objtool point of view.
>>
>> In my understanding:
>>
>>  - UNWINDER_ORC _requires_ objtool,
>>    so I added 'depends on STACK_VALIDATION'.
>>    ('select' would end up with unmet depenency)
>
> Correct.
>
>>  - RETPOLINE _wants_ objtool, so I added 'imply'
>
> Yeah, I think this is fine.
>
> Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>


Thanks for your review!


I have one question.


The package information is contained in the warning/error message.
Is it better to keep this?

If so, I will send v2
to move the information to the help, like this:



 config STACK_VALIDATION
         bool "Compile-time stack metadata validation"
         depends on HAVE_STACK_VALIDATION
         depends on $(success,echo "int main() {}" | $(HOSTCC) -xc -o
/dev/null -lelf -)
         help
          Add compile-time checks to validate stack metadata, including frame
          pointers (if CONFIG_FRAME_POINTER is enabled).  This helps ensure
          that runtime stack traces are more reliable.

          This is also a prerequisite for generation of ORC unwind data, which
          is needed for CONFIG_UNWINDER_ORC.

+         To enable this, the host compiler needs to be able to link libelf.
+         If it is missing, please install libelf-dev, libelf-devel or
+         elfutils-libelf-devel.

          For more information, see
          tools/objtool/Documentation/stack-validation.txt.


-- 
Best Regards
Masahiro Yamada
