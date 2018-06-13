Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:59594 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932596AbeFMAHS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 20:07:18 -0400
Subject: Re: uapi headers userspace build results
References: <8b90457a-5b1d-818c-d2d6-ba3d16ad3eaf@infradead.org>
 <1ef3a7b9-5172-9f7a-01fa-4866e765fbbe@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b5a73c3f-b70d-110f-896d-82fd81982cf8@infradead.org>
Date: Tue, 12 Jun 2018 17:07:16 -0700
MIME-Version: 1.0
In-Reply-To: <1ef3a7b9-5172-9f7a-01fa-4866e765fbbe@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jayant Chowdhary <jchowdhary@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, kernel-team@android.com

On 06/12/2018 01:39 PM, Jayant Chowdhary wrote:
> Hi Randy,
> 
> On 06/11/2018 10:49 PM, Randy Dunlap wrote:
>> Hi,
>>
>> Here is what I have so far.  It begins with a makefile and some
>> template files that are added to.  There's a good bit of Perl also.
>>
>> I put all of these files in tools/uapi/ and run them from there.
>>
>> There is one .c file generated for each .h file in builddir/usr/include
>> (O=builddir).
>>
> 
> Thanks for this! I wrote a small Makefile (uapi-compile.mk) which I'd put in
> tools/build (I can change this to tools/uapi, if that is more apt).

Your makefile foo is much better than mine is.
Yes, I think that it deserves to be in its own sub-directory.

> uapi-compile.mk straight-away compiles the uapi headers, without pulling them
> into any generated c source files. It may also be invoked with an environment

Hm, I didn't even know that is possible.

> variable 'UAPI_DIR' specifying the directory, for which the user would like to
> compile headers. This way we can test a directory at a time as well. In your

Yes, good, I was planning to make a way to restrict the build to certain sub-dirs.

> opinion, would this be simpler to have rather than having to auto-generate c
> source files including each uapi header and also autog-enerating the make
> targets? I feel like this approach would make maintaining these makefiles/
> scripts easier as well.

Sure, this is much better than my scripts.

>> Out of 889 header files, I see 45 errors.  That is better than I expected.
>>
>> The makefiles and scripts are attached (tar), as well as the output (I used
>> 'make -ik' so that make would keep going after errors and attempt to build
>> all target files).
>>
>> have fun!
>>
> 
> I did a 'make ARCH=arm64 headers_install' from the kernel source's root, and
> then a 'make -kf uapi-compile.mk all > build.log 2>&1' to compile all the
> headers. Out of 864 headers, I see 20 compilation failures.
> 
> I'm attaching uapi-compile.mk and the build.log file along.

I have some usage comments.

Since I ran 'make ARCH=x86_64 O=xx64 headers_install', I had to modify
uapi-compile.mk to use that SRC_DIR:

SRC_DIR :=../../xx64

Also, I first tried to make BDIR as a sub-directory of tools/uapi/ and
uapi-compile.mk did not work (when using BDIR=BDIR).
Then I did 'mkdir ../../xx64/BDIR' and specified BDIR=../../xx64/BDIR and
that worked.  But:  that sub-dir is not used:

gcc -I../../xx64/usr/include/ --include=../../xx64/usr/include/linux/posix_types.h --include=../../xx64/usr/include/asm-generic/ipcbuf.h --include=stdarg.h --include=stdint.h --include=stddef.h -c ../../xx64/usr/include//linux/caif/caif_socket.h -o ../../xx64/BDIR/../../xx64/usr/include//linux/caif/caif_socket.o
[see the next comment]

Oh, this makefile builds the .o files in the same sub-dirs as their
respective .h files.  I don't especially like that, but as long as
make clean works, it will do.  [and make clean does work]

Thanks.
-- 
~Randy
