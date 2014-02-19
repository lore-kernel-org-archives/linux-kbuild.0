Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:37913 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaBSCSA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 21:18:00 -0500
Received: by mail-pd0-f171.google.com with SMTP id g10so16978172pdj.16
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2014 18:17:59 -0800 (PST)
Message-ID: <53041454.6090404@converseincode.com>
Date: Tue, 18 Feb 2014 18:17:56 -0800
From: Behan Webster <behanw@converseincode.com>
MIME-Version: 1.0
Subject: Re: linux-next
References: <5303C695.4030403@converseincode.com> <20140219111753.23912fa4bdbfeba7aa6a6c52@canb.auug.org.au>
In-Reply-To: <20140219111753.23912fa4bdbfeba7aa6a6c52@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, =?ISO-8859-1?Q?Jan-Simon_M=F6ller?= <dl9pf@gmx.de>

On 02/18/14 16:17, Stephen Rothwell wrote:
> Hi,
>
> On Tue, 18 Feb 2014 12:46:13 -0800 Behan Webster <behanw@converseincode.com> wrote:
>> I'm assuming this is the right way to ask about being added to
>> linux-next. If it isn't please point me in the right direction.
> Correct, but usually you would cc any interested parties so that I can
> get some feel for when this code might be merged into Linus' tree.
Understood.

Mostly gathering up what is necessary at this point.

We are indeed working on sending patches to the appropriate people.

>> The LLVMLinux project would like to participate in the linux-next tree
>> if possible. We have a branch in our kernel git tree now into which we
>> have put some of our patches. At the moment, the patches in next are
>> some of the most core changes which enable clang in Kbuild, but don't
>> get in the way of the use of gcc.We'll put more patches in the branch as
>> our other changes are accepted. We'd like more visibility of some of the
>> changes we'd like in order to enable clang, and a way to help make sure
>> that we aren't breaking anything in other people's work.
>>
>> http://git.linuxfoundation.org/llvmlinux/kernel.git (for-next branch)
> Normally you would cite the git:// URL ..
Doh. Yes. That would make sense too. A simple protocol change to the URL 
is all it takes. Both are available.

git://git.linuxfoundation.org/llvmlinux/kernel.git


>> Otherwise we're publishing all of our patches in the master branch of
>> this git tree.  Currently we're working on enabling clang support for
>> x86, arm, and arm64.
>>
>> The LLVMLinux project is working on changes to the LLVM/clang toolchain
>> as well as to the linux kernel code in order to be able to compile the
>> kernel with clang.
> I have no objection to this, but would like to see more of these patches
> reviewed by (among others) the kbuild guys (cc'd).  I also could not find
> some of these patches published on lkml (where I would expect to see
> them).  And the top patch has a very uninformative commit message :-(
Of course. That is the intention. I'll review all the commit messages as 
well.

Thanks for the info.

Behan

-- 
Behan Webster
behanw@converseincode.com

