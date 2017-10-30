Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:39214 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752449AbdJ3PRy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 11:17:54 -0400
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] Check all .c files for bad kernel-doc comments
In-Reply-To: <20171030134007.GA2846@bombadil.infradead.org>
References: <20171027194149.14328-1-willy@infradead.org> <CAK7LNATB+mJgMi4sfxb04zYwE5hfv2zONiBHXXtk7wq=No4DNw@mail.gmail.com> <20171030134007.GA2846@bombadil.infradead.org>
Date: Mon, 30 Oct 2017 17:19:18 +0200
Message-ID: <87mv48fytl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthew Wilcox <willy@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>

On Mon, 30 Oct 2017, Matthew Wilcox <willy@infradead.org> wrote:
> On Mon, Oct 30, 2017 at 12:40:20PM +0900, Masahiro Yamada wrote:
>> 2017-10-28 4:41 GMT+09:00 Matthew Wilcox <willy@infradead.org>:
>> > Implement a '-none' output mode for kernel-doc which will only output
>> > warning messages, and suppresses the warning message about there being
>> > no kernel-doc in the file.  Add it to the rule to build .o files from .c
>> > files, so it will check all .c files that have been modified.
>> >
>> > Adds about 1300 warnings to my build, but will hopefully discourage
>> > people from introducing more kerneldoc mistakes.
>> 
>> Basically, I think this is good,
>> but it is controversial to sprinkle warnings by default.
>
> Yes, it is.  I just got three nastygrams from 01.org ;-)
>
> But if it's not turned on by default, then people aren't going to notice
> when they introduce new warnings.  I think it needs to be up to someone
> like Andrew or Linus to decide when to add these warnings by default.
> Maybe we should do something like you have below for now, then work on
> cleaning up a few hundred of these warnings, then enable this by default?
>
> Thanks for looking at this!
>
>> Maybe,
>> 
>> ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
>> cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $< ;
>> endif
>> 
>> 
>> so that this is checked only when W=... is given?

Related, there was also a script to do reStructuredText lint style
checks in addition to the kernel-doc checks using make CHECK and
C=1. See [1].


BR,
Jani.


[1] http://mid.mail-archive.com/87h98quc1w.fsf@intel.com




> --
> To unsubscribe from this list: send the line "unsubscribe linux-doc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Jani Nikula, Intel Open Source Technology Center
