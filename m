Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:38573 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753441AbeEWBX5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 21:23:57 -0400
Received: by mail-ot0-f196.google.com with SMTP id n3-v6so23279255ota.5
        for <linux-kbuild@vger.kernel.org>; Tue, 22 May 2018 18:23:57 -0700 (PDT)
Subject: Re: [PATCHv3 2/2] x86/vdso: Add build salt to the vDSO
References: <20180523001939.9431-1-labbott@redhat.com>
 <20180523001939.9431-3-labbott@redhat.com>
 <CALCETrX9P2Lwrx7wGc22poVWX2AHAqXbUdhcijyoJ3tGhaxijg@mail.gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <012c44ae-d57b-1123-f74c-eb228537600c@redhat.com>
Date: Tue, 22 May 2018 18:23:53 -0700
MIME-Version: 1.0
In-Reply-To: <CALCETrX9P2Lwrx7wGc22poVWX2AHAqXbUdhcijyoJ3tGhaxijg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Mark Wielaard <mjw@fedoraproject.org>, "H. J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org

On 05/22/2018 05:33 PM, Andy Lutomirski wrote:
> On Tue, May 22, 2018 at 5:19 PM Laura Abbott <labbott@redhat.com> wrote:
> 
> 
>> The vDSO is linked separately from the kernel and modules. Ensure it picks
>> up the comment section, if available.
> 
> Did you end up preferring this to just sticking the kernel version in a
> .comment in the vDSO for some reason?
> 

That's a good idea I hadn't considered. I'll do that for the next version.

Thanks,
Laura
