Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:49920 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730869AbeHGSqP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Aug 2018 14:46:15 -0400
Subject: Re: debugging kbuild
References: <CAKwvOdkozP4t3AusfnKfrTmhyrXh4JW4m-ersfnoeTWXcMfJSw@mail.gmail.com>
 <20180807100822.GD31204@gate.crashing.org>
 <CAKwvOd=FARo+s_YKiRQYpTObdDHA=LmCQxtNkdRqsDY42Aztxg@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0a3dbeeb-b169-2d8d-3175-6e7c1ebe2a7d@infradead.org>
Date: Tue, 7 Aug 2018 09:31:03 -0700
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=FARo+s_YKiRQYpTObdDHA=LmCQxtNkdRqsDY42Aztxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, segher@kernel.crashing.org
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 08/07/2018 09:29 AM, Nick Desaulniers wrote:
> On Tue, Aug 7, 2018 at 3:08 AM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
>>
>> On Mon, Aug 06, 2018 at 04:31:14PM -0700, Nick Desaulniers wrote:
>>> Is there a way to print the exact command that's being invoked from
>>> Make? For example, some of the macro's in scripts/Kbuild.include are
>>> tricky to unwind. Is there a way to dump each sub command being run?
>>
>> There always is strace...  Or maybe  make -dj  and friends.
> 
> Hmm...I'm debugging a 4.9 LTS based kernel. `make V=1` and `make -dj`
> were things I tried, but don't seem to be printing the commands being
> executed (only "Reading makefile ...") until the first warning is hit.
> I wonder if someone is setting the quiet variable somehow, or if I'm
> missing a patch...
> 
> Thanks for the ideas.
> 

Yeah, that sounds like -s (silent) is set.

-- 
~Randy
