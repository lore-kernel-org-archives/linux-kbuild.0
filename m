Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:28547 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752007Ab1KUSei (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 13:34:38 -0500
Message-ID: <4ECA99B2.6080800@linux.intel.com>
Date: Mon, 21 Nov 2011 10:34:26 -0800
From: Darren Hart <dvhart@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
References: <1321567131.25715.32.camel@work-vm> <4EC8F907.4060906@suse.cz> <CACqU3MUyHgLfLohLKQQV4+WKhpwW3xiS5hM51xtngs1pWUL9pg@mail.gmail.com>
In-Reply-To: <CACqU3MUyHgLfLohLKQQV4+WKhpwW3xiS5hM51xtngs1pWUL9pg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, john stultz <johnstul@us.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, linux-kbuild@vger.kernel.org



On 11/20/2011 10:05 AM, Arnaud Lacombe wrote:
> Hi,
> 
> On Sun, Nov 20, 2011 at 7:56 AM, Michal Marek <mmarek@suse.cz> wrote:
>> On 17.11.2011 22:58, john stultz wrote:
>>> Hey Andrew,
>>>       I've tried sending this via Michal a few times, but haven't heard much
>>> back. So I wanted to check if you would consider merging it via your
>>> tree, or if you had any suggestions of who would be better to
>>> review/merge this.
>>
>> My concern was that the script works around missing features in kconfig,
>> instead of fixing kconfig. Don't get me wrong, I do believe that the
>> script is useful, but if you are submitting to mainline anyway, why
>> don't you fix/enhance kconfig in mainline and have a much simpler script
>> making use of the enhanced kconfig?
>>
> FWIW, as much as I agree with you, kconfig is currently a bit too
> static, with too much assumption, do any advanced stuff. I have WIP in
> the area, but I prefer not giving ETA. In the mean time, I think
> John's script could fill the gap.

The script is also at least partly usable in older kernel trees without
having to modify Kconfig there. It has some value as a standalone
script. Not to say that we shouldn't also see about updating Kconfig as
well.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
