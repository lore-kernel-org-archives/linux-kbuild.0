Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753780AbeGEVq7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 17:46:59 -0400
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92707240DA
        for <linux-kbuild@vger.kernel.org>; Thu,  5 Jul 2018 21:46:57 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id z13-v6so12647855wma.5
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jul 2018 14:46:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2abd8138-0f62-79a5-5a2c-8e08aee171b8@redhat.com>
References: <20180703233430.14416-1-labbott@redhat.com> <20180703233430.14416-3-labbott@redhat.com>
 <CALCETrVZi2WYbBSifaNV4wajj52PyG-w7z9DekfJvSuZAKi1nA@mail.gmail.com> <2abd8138-0f62-79a5-5a2c-8e08aee171b8@redhat.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 5 Jul 2018 14:46:35 -0700
Message-ID: <CALCETrUdxS5JGJMKjBGWhaLM8yqzW+MjVcmF4QgczQQfFFOk3w@mail.gmail.com>
Subject: Re: [PATCHv5 2/4] x86: Add build salt to the vDSO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, Mark Wielaard <mjw@fedoraproject.org>, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org

Sure.

On Thu, Jul 5, 2018 at 12:08 PM, Laura Abbott <labbott@redhat.com> wrote:
> On 07/05/2018 08:58 AM, Andy Lutomirski wrote:
>>
>> On Tue, Jul 3, 2018 at 4:34 PM, Laura Abbott <labbott@redhat.com> wrote:
>>>
>>>
>>> The vDSO needs to have a unique build id in a similar manner
>>> to the kernel and modules. Use the build salt macro.
>>>
>>
>> Looks good to me.  I have no idea whose tree these would go through.
>>
>
> I was intending this to go through kbuild tree. Can I take this
> as an Ack?
>
>
>>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>>> ---
>>> v5: Switched to using the single line BUILD_SALT macro
>>> ---
>>>   arch/x86/entry/vdso/vdso-note.S   | 3 +++
>>>   arch/x86/entry/vdso/vdso32/note.S | 3 +++
>>>   2 files changed, 6 insertions(+)
>>>
>>> diff --git a/arch/x86/entry/vdso/vdso-note.S
>>> b/arch/x86/entry/vdso/vdso-note.S
>>> index 79a071e4357e..79423170118f 100644
>>> --- a/arch/x86/entry/vdso/vdso-note.S
>>> +++ b/arch/x86/entry/vdso/vdso-note.S
>>> @@ -3,6 +3,7 @@
>>>    * Here we can supply some information useful to userland.
>>>    */
>>>
>>> +#include <linux/build-salt.h>
>>>   #include <linux/uts.h>
>>>   #include <linux/version.h>
>>>   #include <linux/elfnote.h>
>>> @@ -10,3 +11,5 @@
>>>   ELFNOTE_START(Linux, 0, "a")
>>>          .long LINUX_VERSION_CODE
>>>   ELFNOTE_END
>>> +
>>> +BUILD_SALT
>>> diff --git a/arch/x86/entry/vdso/vdso32/note.S
>>> b/arch/x86/entry/vdso/vdso32/note.S
>>> index 9fd51f206314..e78047d119f6 100644
>>> --- a/arch/x86/entry/vdso/vdso32/note.S
>>> +++ b/arch/x86/entry/vdso/vdso32/note.S
>>> @@ -4,6 +4,7 @@
>>>    * Here we can supply some information useful to userland.
>>>    */
>>>
>>> +#include <linux/build-salt.h>
>>>   #include <linux/version.h>
>>>   #include <linux/elfnote.h>
>>>
>>> @@ -14,6 +15,8 @@ ELFNOTE_START(Linux, 0, "a")
>>>          .long LINUX_VERSION_CODE
>>>   ELFNOTE_END
>>>
>>> +BUILD_SALT
>>> +
>>>   #ifdef CONFIG_XEN
>>>   /*
>>>    * Add a special note telling glibc's dynamic linker a fake hardware
>>> --
>>> 2.17.1
>>>
>
