Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32781 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfE1RGT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 May 2019 13:06:19 -0400
Received: by mail-pg1-f193.google.com with SMTP id h17so11377144pgv.0
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2019 10:06:19 -0700 (PDT)
Subject: Re: uapi headers userspace build results
References: <8b90457a-5b1d-818c-d2d6-ba3d16ad3eaf@infradead.org>
 <1ef3a7b9-5172-9f7a-01fa-4866e765fbbe@google.com>
 <b5a73c3f-b70d-110f-896d-82fd81982cf8@infradead.org>
 <8a36d3ba-977b-49ca-c431-90ef53071f88@google.com>
 <9b76d1b6-08a4-36cf-4fc8-661b216ca433@infradead.org>
 <becd3d01-509b-d470-df48-e5ef0e21ae2a@infradead.org>
From: Jayant Chowdhary <jchowdhary@google.com>
Message-ID: <40fd548e-11ff-077c-6bdb-093cd2910e6e@google.com>
Date: Tue, 28 May 2019 10:06:14 -0700
MIME-Version: 1.0
In-Reply-To: <becd3d01-509b-d470-df48-e5ef0e21ae2a@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, kernel-team@android.com, trong@google.com, maennich@google.com

Hi Randy,
Apologies for not keeping everyone up to date on this. A couple of colleagues
(cc'ed): Tri and Matthias, are going to be taking over this work.

Thanks,
Jayant

On 5/27/19 3:12 PM, Randy Dunlap wrote:
> Hi Jayant,
> 
> What ever happened to this script and subsequent patches?
> 
> thanks.
> 
> On 6/19/18 11:17 AM, Randy Dunlap wrote:
>> On 06/18/2018 06:47 PM, Jayant Chowdhary wrote:
>>> Hi Randy,
>>>
>>> On 06/12/2018 05:07 PM, Randy Dunlap wrote:
>>>> On 06/12/2018 01:39 PM, Jayant Chowdhary wrote:
>>>>> Hi Randy,
>>>>>
>>>>> On 06/11/2018 10:49 PM, Randy Dunlap wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Here is what I have so far.  It begins with a makefile and some
>>>>>> template files that are added to.  There's a good bit of Perl also.
>>>>>>
>>>>>> I put all of these files in tools/uapi/ and run them from there.
>>>>>>
>>>>>> There is one .c file generated for each .h file in builddir/usr/include
>>>>>> (O=builddir).
>>>>>>
>>>>>
>>>>> Thanks for this! I wrote a small Makefile (uapi-compile.mk) which I'd put in
>>>>> tools/build (I can change this to tools/uapi, if that is more apt).
>>>>
>>>> Your makefile foo is much better than mine is.
>>>> Yes, I think that it deserves to be in its own sub-directory.
>>>>
>>>>> uapi-compile.mk straight-away compiles the uapi headers, without pulling them
>>>>> into any generated c source files. It may also be invoked with an environment
>>>>
>>>> Hm, I didn't even know that is possible.
>>>>
>>>>> variable 'UAPI_DIR' specifying the directory, for which the user would like to
>>>>> compile headers. This way we can test a directory at a time as well. In your
>>>>
>>>> Yes, good, I was planning to make a way to restrict the build to certain sub-dirs.
>>>>
>>>>> opinion, would this be simpler to have rather than having to auto-generate c
>>>>> source files including each uapi header and also autog-enerating the make
>>>>> targets? I feel like this approach would make maintaining these makefiles/
>>>>> scripts easier as well.
>>>>
>>>> Sure, this is much better than my scripts.
>>>>
>>>>>> Out of 889 header files, I see 45 errors.  That is better than I expected.
>>>>>>
>>>>>> The makefiles and scripts are attached (tar), as well as the output (I used
>>>>>> 'make -ik' so that make would keep going after errors and attempt to build
>>>>>> all target files).
>>>>>>
>>>>>> have fun!
>>>>>>
>>>>>
>>>>> I did a 'make ARCH=arm64 headers_install' from the kernel source's root, and
>>>>> then a 'make -kf uapi-compile.mk all > build.log 2>&1' to compile all the
>>>>> headers. Out of 864 headers, I see 20 compilation failures.
>>>>>
>>>>> I'm attaching uapi-compile.mk and the build.log file along.
>>>>
>>>> I have some usage comments.
>>>>
>>>> Since I ran 'make ARCH=x86_64 O=xx64 headers_install', I had to modify
>>>> uapi-compile.mk to use that SRC_DIR:
>>>>
>>>> SRC_DIR :=../../xx64
>>>>
>>>> Also, I first tried to make BDIR as a sub-directory of tools/uapi/ and
>>>> uapi-compile.mk did not work (when using BDIR=BDIR).
>>>> Then I did 'mkdir ../../xx64/BDIR' and specified BDIR=../../xx64/BDIR and
>>>> that worked.  But:  that sub-dir is not used:
>>>>
>>>> gcc -I../../xx64/usr/include/ --include=../../xx64/usr/include/linux/posix_types.h --include=../../xx64/usr/include/asm-generic/ipcbuf.h --include=stdarg.h --include=stdint.h --include=stddef.h -c ../../xx64/usr/include//linux/caif/caif_socket.h -o ../../xx64/BDIR/../../xx64/usr/include//linux/caif/caif_socket.o
>>>> [see the next comment]
>>>>
>>>> Oh, this makefile builds the .o files in the same sub-dirs as their
>>>> respective .h files.  I don't especially like that, but as long as
>>>> make clean works, it will do.  [and make clean does work]
>>>>
>>>
>>> Thanks for these comments. I'll take care of them in my patch-set. I've got a
>>> couple of questions for you. Since most of the errors were found in the
>>> include/uapi/linux directory, I tried investigating why.
>>
>> Please also repost your latest patch-set.
>>
>>> 1) I found that multiple headers depend on the definition of types such as
>>> pid_t, which have no definition in the set of uapi headers. There is a
>>> definition (of pid_t) in include/linux/types.h, and I thought we could try
>>> exposing that in the set of uapi headers. One problem I can see with that is
>>> that the header has some definitions which depend on kernel configs: eg:
>>> CONFIG_ARCH_DMA_ADDR_T_64BIT. Since user-land programs shouldn't really assume
>>> kernel configs, I was thinking we should re-factor this header so that
>>> appropriate parts can be exposed to user-land.
>>
>> Sure, that's worth a try.  Mostly on a case-by-case basis.
>>
>> I see that (at least in the distro that I am using)
>> /usr/include/asm-generic/posix_types.h has a typedef for __kernel_pid_t.
>> I wonder if that could be co-opted, but I expect that this would have
>> type/size issues.
>>
>> OTOH, 'man getpid' uses pid_t and refers to <sys/types.h> and <unistd.h>,
>> so there should already be a pid_t for userspace.  Just #include more
>> headers files.  :)
>>
>>> 2) Some headers try to expose information which should probably not be exposed
>>> to user-land. eg: wait_queue_head in linux/coda_psdev.h (this header should
>>> probably be removed altogether ?)
>>
>> I suppose that header file describes a kernel-to-userspace ("Venus") interface,
>> so maybe not removed altogether.  But the wait_queue_head_t part of it should
>> just be some padding/reserved field (of what size/type?).
>>
>>
>>> Do you have better ideas ?
>>
>> slow and steady.
>>
> 
> 
