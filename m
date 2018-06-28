Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44237 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966300AbeF1N5Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jun 2018 09:57:25 -0400
MIME-Version: 1.0
In-Reply-To: <d55c2992-09b8-5182-419d-8efa5782ea16@redhat.com>
References: <20180612003224.3658-1-labbott@redhat.com> <20180612003224.3658-4-labbott@redhat.com>
 <20180621124334.GA30110@gmail.com> <d55c2992-09b8-5182-419d-8efa5782ea16@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Jun 2018 22:56:27 +0900
Message-ID: <CAK7LNATnp8oow-Ra36Ucy3GOfYH_TxmxCPkwMw6WceW5fTbCcA@mail.gmail.com>
Subject: Re: [PATCHv4 3/3] x86: Add build salt to the vDSO and kernel linker scripts
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, Andy Lutomirski <luto@kernel.org>, Mark Wielaard <mjw@fedoraproject.org>, "H . J . Lu" <hjl.tools@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi.


2018-06-22 0:58 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> On 06/21/2018 05:43 AM, Ingo Molnar wrote:
>>
>>
>> * Laura Abbott <labbott@redhat.com> wrote:
>>
>>>
>>> Both the kernel and the vDSO need to have unique build ids.
>>> Insert the build salt section to make the build ids unique.
>>>
>>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>>> ---
>>>   arch/x86/entry/vdso/vdso-layout.lds.S | 3 ++-
>>>   arch/x86/kernel/vmlinux.lds.S         | 1 +
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>>
>> Acked-by: Ingo Molnar <mingo@kernel.org>
>>
>> What is the upstream merge plan for this series? kbuild tree?
>>
>> Thanks,
>>
>>         Ingo
>>
>
> There was an alternate proposal that requires slightly fewer
> changes that needs to be cleaned up and submitted. I do
> think the plan is for the series to eventually go through
> the kbuild tree.


Yes.  V5 is welcome.

Thanks.





-- 
Best Regards
Masahiro Yamada
