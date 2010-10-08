Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:48233 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758997Ab0JHSFW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Oct 2010 14:05:22 -0400
MIME-Version: 1.0
In-Reply-To: <20101008085508.GG11681@bicker>
References: <AANLkTi=Hc2eWzOQ_xKBYsqfwkkiKGU0v42jUhLQ8K7dU@mail.gmail.com>
	<AANLkTinynZj9bYFAyfRTF2uopmLe6Ls4YGdZPqCAJTpR@mail.gmail.com>
	<20101008085508.GG11681@bicker>
Date: Fri, 8 Oct 2010 11:05:20 -0700
Message-ID: <AANLkTi=LhU2z4FoamrLpQZS06LSSc736=-_PUXj6nbNK@mail.gmail.com>
Subject: Re: [PATCH 00/33] Staging: Fixed <module-objs> to <module>-y
From: matt mooney <mfmooney@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: T Dent <tdent48227@gmail.com>, greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Fri, Oct 8, 2010 at 1:55 AM, Dan Carpenter <error27@gmail.com> wrote:
> On Fri, Oct 08, 2010 at 12:16:35AM -0700, matt mooney wrote:
>> On Thu, Oct 7, 2010 at 6:35 PM, T Dent <tdent48227@gmail.com> wrote:
>> > I patch against the next-20101006 tree.
>> >
>> > The patch series replace use of <module>-objs with <module>-y in the
>> > staging directory.
>>
>> Commit messages are written in the present tense. You happen to be
>> using two different tenses within the commit message, which is truly
>> odd.
>
> Maybe *you* write in the present tense.  Commit messages are important,

This is not my convention; I also wrote my first few patches in the
past tense but noticed they were changed to the present.

> yes, but this in the end we all understood the message fine.  Please
> don't be a jerk.

Rereading what I wrote, I realize it can be interpreted as being rude,
but I think that is due to my direct writing style. My tone while
writing it was very lighthearted although without knowing me I
completely understand how it could come off wrong. To clarify, I
thought it was odd because the two lines (subject and body) basically
said the same thing using different verb tenses; my aim was not to
pick apart the grammar.

Thanks,
mfm


-- 
GPG-Key: 9AFE00EA
