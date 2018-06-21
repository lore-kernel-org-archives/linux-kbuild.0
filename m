Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:39491 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933256AbeFUP6X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jun 2018 11:58:23 -0400
Received: by mail-qt0-f194.google.com with SMTP id p23-v6so3288594qtn.6
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jun 2018 08:58:23 -0700 (PDT)
Subject: Re: [PATCHv4 3/3] x86: Add build salt to the vDSO and kernel linker
 scripts
References: <20180612003224.3658-1-labbott@redhat.com>
 <20180612003224.3658-4-labbott@redhat.com> <20180621124334.GA30110@gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <d55c2992-09b8-5182-419d-8efa5782ea16@redhat.com>
Date: Thu, 21 Jun 2018 08:58:18 -0700
MIME-Version: 1.0
In-Reply-To: <20180621124334.GA30110@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org

On 06/21/2018 05:43 AM, Ingo Molnar wrote:
> 
> * Laura Abbott <labbott@redhat.com> wrote:
> 
>>
>> Both the kernel and the vDSO need to have unique build ids.
>> Insert the build salt section to make the build ids unique.
>>
>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>> ---
>>   arch/x86/entry/vdso/vdso-layout.lds.S | 3 ++-
>>   arch/x86/kernel/vmlinux.lds.S         | 1 +
>>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> Acked-by: Ingo Molnar <mingo@kernel.org>
> 
> What is the upstream merge plan for this series? kbuild tree?
> 
> Thanks,
> 
> 	Ingo
> 

There was an alternate proposal that requires slightly fewer
changes that needs to be cleaned up and submitted. I do
think the plan is for the series to eventually go through
the kbuild tree.

Thanks,
Laura
