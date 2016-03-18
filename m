Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49]:33694 "EHLO
	mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895AbcCRFbh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 01:31:37 -0400
MIME-Version: 1.0
In-Reply-To: <CA+ekxPUKXFHsUnUme2J12P8tuv5Obb3r7+vO9BOd551Uzp-btg@mail.gmail.com>
References: <20160314235035.GA5799@localhost.localdomain>
	<1457999823.11972.143.camel@perches.com>
	<20160315112458.7248d665@canb.auug.org.au>
	<CA+ekxPU9D9dfhtzEP+bEvTthg3M_UWyY1zQHaRb0APppp-t7-g@mail.gmail.com>
	<20160315130339.688689bd@canb.auug.org.au>
	<20160315151618.GQ29218@thunk.org>
	<CA+ekxPUKXFHsUnUme2J12P8tuv5Obb3r7+vO9BOd551Uzp-btg@mail.gmail.com>
Date: Thu, 17 Mar 2016 23:31:36 -0600
Message-ID: <CA+ekxPUten_O4=bUnnGbOGosO3vOe4zpteuWKDatwY4i-aVB7w@mail.gmail.com>
Subject: Re: [GIT PULL v4.6] MDB Linux Kernel Debugger x86/x86_64
From: Jeffrey Merkey <jeffmerkey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeffrey Merkey <jeffmerkey@gmail.com>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On 3/16/16, Jeffrey Merkey <jeffmerkey@gmail.com> wrote:
> On 3/15/16, Theodore Ts'o <tytso@mit.edu> wrote:
>> On Tue, Mar 15, 2016 at 01:03:39PM +1100, Stephen Rothwell wrote:
>>> We don't generally PGP (GPG) sign commits in the kernel tree (so "-S"
>>> is not required), just tags.  However we always require that anyone who
>>> handles a patch adds a Signed-off-by line to the final commit.  See
>>> Documentation/SubmittingPatches Section 11.
>>
>> In general all commits should have a Signed-Off-By line added.  Once
>> the git branch gets merged, it's hard to tell what is the final commit
>> and what isn't, and in general different commits will have different
>> people needing to vouch for the origins for the contents of that commit.
>>
>> Cheers,
>>
>> 							- Ted
>> 							
>>
>
> Hi Ted,
>
> I will repost this pull request with a signed-off by line for Linus to
> consider.    I am not certain who all should be included in the review
> and I have to be careful how many email recipients I copy.   I will
> post to the folks Joe Perches copied.
>
> Jeff
>

Well, Joe updated checkpatch.pl so now there are some more areas of
cleanup I need to do on the code to remove unsigned casts and replace
them with unsigned int.  I will resubmit at the next merge window for
4.7.  Have not heard a word from Linus about this, Hey Linus, please
don't lion-us by throwing us to the lions.  :-)

Jeff
