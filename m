Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:47874 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936AbbACKgR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Jan 2015 05:36:17 -0500
Received: by mail-wi0-f176.google.com with SMTP id ex7so696445wid.3
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Jan 2015 02:36:16 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
Date: Sat, 3 Jan 2015 11:28:44 +0100
Message-ID: <CA+icZUVTgtSxiYz98nB30u05mzc_exLFhUttFkGwvF58sigx5Q@mail.gmail.com>
Subject: kbuild Git tree and its branches
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi Marek,

can you enlighten me about the usage of your Git tree and its branches?
For me this is a bit unclear.

Looking into the Trees file from Linux-next I see
***kbuild.git#rc-fixes*** [1,3] and ***kbuild.git#for-next*** [2,4]...

#7: kbuild-current git
git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git#rc-fixes

#111: kbuild git
git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git#for-next

Recently I reported some kbuild issues and sent out some own patches
which were pushed or pending.
This stuff is partly in kbuild.git#misc [5] and kbuild.git#kbuild [6].

Are those branches for mainline?
For example, I have seen git-pull request for "misc" stuff [7].

Finally, my question which of your trees are for mainline aka upstream
(Git) or so-called "Linus tree" [8]?
( I would have expected some of the recent commits for "misc" and
"kbuild" to be pulled in "rc-fixes" - this reflects the usage of
"kbuild-current" in Linux-next for me. )

Maybe, you can tell me how your "daily" kbuild workflow is done.
( I am not ashamed to see I have not checked Documentation directory
in Linux source. ]

Thanks for answering my questions in advance.

Regards,
- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Next/Trees?id=next-20150103#n7
[2] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Next/Trees?id=next-20150103#n111
[3] http://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/log/?h=rc-fixes
[4] http://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/log/?h=for-next
[5] http://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/log/?h=misc
[6] http://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/log/?h=kbuild
[7] https://lkml.org/lkml/2014/12/19/354
[8] http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
