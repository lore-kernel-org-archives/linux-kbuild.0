Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53300 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752381AbbASQf4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Jan 2015 11:35:56 -0500
Message-ID: <54BD326A.6030409@osg.samsung.com>
Date: Mon, 19 Jan 2015 09:35:54 -0700
From: Shuah Khan <shuahkh@osg.samsung.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] selftests: Add install target
References: <1420794375-31881-1-git-send-email-mpe@ellerman.id.au> <1420794375-31881-2-git-send-email-mpe@ellerman.id.au> <54B94E75.8030504@osg.samsung.com> <1421627752.3787.8.camel@ellerman.id.au>
In-Reply-To: <1421627752.3787.8.camel@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, mmarek@suse.cz, gregkh@linuxfoundation.org, akpm@linux-foundation.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, keescook@chromium.org, tranmanphong@gmail.com, cov@codeaurora.org, dh.herrmann@gmail.com, hughd@google.com, bobby.prani@gmail.com, serge.hallyn@ubuntu.com, ebiederm@xmission.com, tim.bird@sonymobile.com, josh@joshtriplett.org, koct9i@gmail.com, linux-kbuild@vger.kernel.org, linux-api@vger.kernel.org, netdev@vger.kernel.org

On 01/18/2015 05:35 PM, Michael Ellerman wrote:
> On Fri, 2015-01-16 at 10:46 -0700, Shuah Khan wrote:
>> On 01/09/2015 02:06 AM, Michael Ellerman wrote:
>>> This adds make install support to selftests. The basic usage is:
>>>
>>> $ cd tools/testing/selftests
>>> $ make install
>>>
>>> That installs into tools/testing/selftests/install, which can then be
>>> copied where ever necessary.
>>>
>>> The install destination is also configurable using eg:
>>>
>>> $ INSTALL_PATH=/mnt/selftests make install
>>
>> Please see my response to [PATCH 4/6] kbuild: add a new
>> kselftest_install make target to install selftests
>>
>> These are addressed by the current approach to use existing
>> INSTALL_MOD_PATH.
> 
> No that's a separate issue.
> 
> This patch adds install support for tools/testing/selftests, *completely
> separate* from the kbuild infrastructure. 
> 

What's the use-case for this feature? I don't see why we need multiple
ways to do the install?

thanks,
-- Shuah


-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
