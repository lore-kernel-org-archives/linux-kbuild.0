Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w2.samsung.com ([211.189.100.12]:47032 "EHLO
	usmailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932082AbaHGQNR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Aug 2014 12:13:17 -0400
Message-id: <53E3A599.6090008@samsung.com>
Date: Thu, 07 Aug 2014 10:13:13 -0600
From: Shuah Khan <shuah.kh@samsung.com>
Reply-to: shuah.kh@samsung.com
MIME-version: 1.0
Subject: Re: [PATCH v2] kbuild: kselftest - new make target to build and run
 kernel selftests
References: <1407420192-4928-1-git-send-email-shuah.kh@samsung.com>
 <20140807155713.GA1382@ravnborg.org>
In-reply-to: <20140807155713.GA1382@ravnborg.org>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: mmarek@suse.cz, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuah.kh@samsung.com>

On 08/07/2014 09:57 AM, Sam Ravnborg wrote:
> On Thu, Aug 07, 2014 at 08:03:12AM -0600, Shuah Khan wrote:
>> Add a new make target "kselftest" to enable kernel testing. This
>> new target builds and runs kernel selftests. Running as root is
>> recommended for a complete test run as some tests don't run when
>> run by non-root user.
>
> kselftest will run the test - but will not build the kerenl.
> That is does not build the kernel is IMO a good thing -
> as one may re-run the test while doing work on the kernel, and triggering
> a rebuild to re-run the test is not nice.

Good. That is the reason why I made the change to not run make all.
Result of an aha moment when I was working on the v2 :)

>
> The changelog + help text needs to be updated to reflect that the kernel is not
> built when you use "make kselftest".

I will update the changelog and re-send the patch.

>
> On top of this - can you please tell what plans exists to extend this.
> When we discussed "devtest" it was said that it would not be a wrapper
> for selftests run_tests only, but more was planned to be added.
>

I posted agenda item to ksummit-discuss this morning outlining the
progress made in 3.17 and what's planned for 3.18 and beyond. I think
the post is waiting for moderator approval.

-- Shuah

-- 
Shuah Khan
Senior Linux Kernel Developer - Open Source Group
Samsung Research America(Silicon Valley)
shuah.kh@samsung.com | (970) 672-0658
