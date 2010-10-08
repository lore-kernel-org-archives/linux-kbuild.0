Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:45662 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750776Ab0JHIjf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Oct 2010 04:39:35 -0400
MIME-Version: 1.0
In-Reply-To: <AANLkTinynZj9bYFAyfRTF2uopmLe6Ls4YGdZPqCAJTpR@mail.gmail.com>
References: <AANLkTi=Hc2eWzOQ_xKBYsqfwkkiKGU0v42jUhLQ8K7dU@mail.gmail.com>
	<AANLkTinynZj9bYFAyfRTF2uopmLe6Ls4YGdZPqCAJTpR@mail.gmail.com>
Date: Fri, 8 Oct 2010 04:39:34 -0400
Message-ID: <AANLkTikj3gfMZTAc6ji+bZkzwQV_U6CBf-av4_A60jVY@mail.gmail.com>
Subject: Re: [PATCH 00/33] Staging: Fixed <module-objs> to <module>-y
From: T Dent <tdent48227@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfmooney@gmail.com>
Cc: greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On 10/8/10, matt mooney <mfmooney@gmail.com> wrote:
> On Thu, Oct 7, 2010 at 6:35 PM, T Dent <tdent48227@gmail.com> wrote:
>> I patch against the next-20101006 tree.
>>
>> The patch series replace use of <module>-objs with <module>-y in the
>> staging directory.
>
> Commit messages are written in the present tense. You happen to be
> using two different tenses within the commit message, which is truly
> odd.  And why did you not split apart those atrocious statements with
> the infinite column width?
>
You're right I didn't notice. I just copy-and-paste a lot of commits
and just switch the directory.

> This patch series adds little benefit.  As Sam has suggested, a more
> general cleanup would be a better goal, and staging is an area that
> needs extra attention some of which has already been pointed out in
> other emails.

I am going to do a more general clean up. I was just breaking it up
into parts, so that its easier to review and get applied.

> -mfm
>
> --
> GPG-Key: 9AFE00EA
>

Thanks,

Tracey D
