Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:34953 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753562AbbAESfJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Jan 2015 13:35:09 -0500
Received: by mail-we0-f169.google.com with SMTP id m14so8383773wev.14
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Jan 2015 10:35:08 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <54AA62AD.1030107@suse.cz>
References: <CA+icZUVTgtSxiYz98nB30u05mzc_exLFhUttFkGwvF58sigx5Q@mail.gmail.com>
	<54AA62AD.1030107@suse.cz>
Date: Mon, 5 Jan 2015 19:35:01 +0100
Message-ID: <CA+icZUU+gLKpX=h6aDh40iTmWP6=5DObxmYV+SJg6ZyhvOOgEg@mail.gmail.com>
Subject: Re: kbuild Git tree and its branches
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Mon, Jan 5, 2015 at 11:08 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 2015-01-03 11:28, Sedat Dilek wrote:
>> Hi Marek,
>>
>> can you enlighten me about the usage of your Git tree and its branches?
>> For me this is a bit unclear.
>>
>> Looking into the Trees file from Linux-next I see
>> ***kbuild.git#rc-fixes*** [1,3] and ***kbuild.git#for-next*** [2,4]...
>>
>> #7: kbuild-current git
>> git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git#rc-fixes
>>
>> #111: kbuild git
>> git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git#for-next
>>
>> Recently I reported some kbuild issues and sent out some own patches
>> which were pushed or pending.
>> This stuff is partly in kbuild.git#misc [5] and kbuild.git#kbuild [6].
>
> rc-fixes is for the current -rc phase. for-next is for the next merge
> window and it is a merge of the topic branches. The for-next branch is
> just a convenience so that it's always these two branches that Stephen
> pulls into linux-next.
>
>
>> Finally, my question which of your trees are for mainline aka upstream
>> (Git) or so-called "Linus tree" [8]?
>> ( I would have expected some of the recent commits for "misc" and
>> "kbuild" to be pulled in "rc-fixes" - this reflects the usage of
>> "kbuild-current" in Linux-next for me. )
>>
>> Maybe, you can tell me how your "daily" kbuild workflow is done.
>> ( I am not ashamed to see I have not checked Documentation directory
>> in Linux source. ]
>
> Regression fixes are applied to the rc-fixes branch, stuff for the next
> merge window goes to either kbuild (core changes), misc (packaging
> targets, documentation, etc), or some other branch if it makes sense. At
> the end of the day, I merge the topic branches into for-next, do some
> test builds and push everything to git.kernel.org. The rc-fixes branch
> is sent to Linus for the next -rc after some time, the other topic
> branches are sent in the next merge window. Then I update my branches to
> the new -rc1 and start over.
>

OK, thanks for the clarification and insights of your workflow.
You can point "confused people" like me to your posting :-).

In other Git trees I see for example (here: linux-block)...

for-3.20/core

for-3.20/drivers

...which are merged into the...

for-next

...branch.

That makes it very obvious for followers.

I remember I asked Daniel Vetter to enlighten about drm/i915 development.
This resulted in a very nice blog article "drm/i915 Branches
Explained" (see [1]).

Just to give you some inspiration not taping on your nerves.

- Sedat -

[1] http://blog.ffwll.ch/2013/07/drmi915-branches-explained.html
