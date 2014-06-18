Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:59882 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932818AbaFRHwH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jun 2014 03:52:07 -0400
MIME-Version: 1.0
In-Reply-To: <CAADnVQJakSFP8VHJUwh6Z94XkYH7neuamUxHUZ16Q4-YP7O9OQ@mail.gmail.com>
References: <CAOi1vP9YvbroujXEut6Xn-tvv07MNuxanwDrRvDFhS_-HT_5Lg@mail.gmail.com>
	<1402928339-29785-1-git-send-email-mmarek@suse.cz>
	<CAADnVQJakSFP8VHJUwh6Z94XkYH7neuamUxHUZ16Q4-YP7O9OQ@mail.gmail.com>
Date: Wed, 18 Jun 2014 11:52:04 +0400
Message-ID: <CAOi1vP8udouMMHLYUAFT6xo1nQu4RXJkbTBBjpwG3ivNHVWDVw@mail.gmail.com>
Subject: Re: [PATCH] deb-pkg: Fix for relative paths
From: Ilya Dryomov <idryomov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 17, 2014 at 6:47 AM, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Mon, Jun 16, 2014 at 7:18 AM, Michal Marek <mmarek@suse.cz> wrote:
>> When $srctree or $objtree are relative paths, we cannot change directory
>> and refer to them in the same subshell. Do the redirection outside of
>> the subshell to fix this.
>>
>> Reported-by: Ilya Dryomov <idryomov@gmail.com>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
>> ---
>>  scripts/package/builddeb | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> this patch didn't help to fix the broken deb-pkg for me:

Alexei, you must have some other issue with your environment.  This
patch fixes it for me, and in fact I had almost the exact same patch
committed internally in the interim.  (I wanted to give Michal the
opportunity to fix this perhaps in a more general way, since tar
targets seems to misbehave too.)

Thanks,

                Ilya
