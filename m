Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [64.129.254.146] ([64.129.254.146]:13846 "EHLO mail5.wrs.com"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751237AbbJ1GUG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 02:20:06 -0400
Message-ID: <56305D93.5020702@windriver.com>
Date: Wed, 28 Oct 2015 01:30:59 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 00/10] merge_config misc reworks and testcases
References: <1445992931-28107-1-git-send-email-olof@lixom.net> <20151028050224.GB1854@malice.jf.intel.com>
In-Reply-To: <20151028050224.GB1854@malice.jf.intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On 10/28/2015 01:02 AM, Darren Hart wrote:
> On Wed, Oct 28, 2015 at 09:42:01AM +0900, Olof Johansson wrote:
>> Hi,
>>
>> Somewhat wide distribution list here, since I've added everyone who's
>> touched the script, with the presumption that those have been the major
>> users of it. Please make sure none of these changes break your use cases.
>
> +Bruce. I think you were going to test these with the linux-yocto tooling. Did
> you get a chance to run that test? I'd like your thoughts on the two comments
> below:

I ran some initial tests, but I didn't end up doing a full
update due to other constraints.

But in the next few weeks, I can do that update and full run.

>
>>
>> I've done some reworks of merge_config.sh. I was quite hesitant to start
>> this since there are no good ways to see if your changes break others
>> or not, so the first thing I did was to add some tests. I know this is
>> highly unorthodox so try not to panic. :-)
>>
>> As far as what this series does is:
>>
>> - Adds a way to pass in CONFIG_FOO=<value> on the command line, it gets
>>    treated as a single-entry fragment file
>>
>> - The script now prints the warnings on stderr, and returns non-0 when
>>    something is encountered
>
> This one might impact linux-yocto usage, Bruce? That said, it seems like the
> right thing to do. So I'd still like to see it go in, but we may need to plan to
> update the dependent tooling to use it.

I don't directly let the merge_config output be visible, but capture it
and then do more processing later. So while this may mean that I have
to update some wrappers to capture stderr, it shouldn't be a big deal.

>
>>
>> - Optionally, it'll also return non-0 when a redundant entry is found. I
>>    presumed people rely on -r not being a failure so I did this separately
>>
>> - CONFIG_FOO=n and "# CONFIG_FOO is not set" is now treated the same,
>>    and using the former doesn't cause an invalid warning when the results
>>    are checked at the end
>>
>> - Slightly odd things happened if a fragment contains the same option
>>    twice: It'd produce a warning that was malformed. Now just ignore that
>>    and use only the latest value of said option.
>
> This one will likely impact usage as well. linux-yocto does want to report when
> there is an override, not as an error, but for informational purposes - "Where
> does my option get clobbered?"

I haven't looked at the patches yet (and I will shortly), but if that
is within a single fragment, I can live with it going away, since it is
easy to check that outside of the merge script.

But if this is a redefinition between fragments, that's something different
and something that I capture and report to users, and yes, I
currently take it from the output of the merge_config run. If it goes
away, I'd have to recreate it somehow.

So if this can at least be maintained as enabled via a parameter, that
would be be ideal. Otherwise, I'll have to recreate the output some
other way.

Bruce

>
>
>

