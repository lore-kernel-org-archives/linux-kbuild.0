Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:56821 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751960Ab1FHVKE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jun 2011 17:10:04 -0400
Received: by pzk9 with SMTP id 9so432443pzk.19
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jun 2011 14:10:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DEFDCBB.9090400@suse.cz>
References: <1307479931-10424-1-git-send-email-lacombar@gmail.com>
	<1307509408-2497-1-git-send-email-lacombar@gmail.com>
	<20110608153843.GB4612@sepie.suse.cz>
	<BANLkTingPzEZXbBim4-BmsvZb8SkG++vEw@mail.gmail.com>
	<4DEFDCBB.9090400@suse.cz>
Date: Wed, 8 Jun 2011 17:10:03 -0400
Message-ID: <BANLkTikrUA6TdFgAQw3ZbjUxaDpyAsADsA@mail.gmail.com>
Subject: Re: [RFCv5] Kbuild: factor parser rules
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Wed, Jun 8, 2011 at 4:34 PM, Michal Marek <mmarek@suse.cz> wrote:
> Dne 8.6.2011 18:11, Arnaud Lacombe napsal(a):
>> Hi,
>>
>> On Wed, Jun 8, 2011 at 11:38 AM, Michal Marek <mmarek@suse.cz> wrote:
>>> On Wed, Jun 08, 2011 at 01:03:28AM -0400, Arnaud Lacombe wrote:
>>>> Hi Michal,
>>>>
>>>> Here is some update concerning the parser generation merge. I do not repost the
>>>> whole serie as it may be overkill. You can find the latest branch at:
>>>>
>>>> git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule
>>>>
>>>> So let't get it done the safe way...
>>>>
>>>> Changes since v4:
>>>> [...]
>>>
>>>
>>> Hi, I found now what my problem with genksyms was. I use O= and you
>>> removed the -I$(src) for the lexer (which is a generated file, but needs
>>> genksyms.h from the source directory). With the following patch,
>>> everything should work again (test builds still running, but they built
>>> genksyms already):
>>>
>> yes, I spotted that yesterday, this is fixed in v5.
>
> Then please push it to github :)
>
@#$... I should stop sending stuff at 1 a.m. This is now fixed. New
head is c51572047d18641be2350d188f9493f6a39f6b26.

Btw, as a small remainder, none of the patch are Signed-off. When
you'll be happy with the branch, I'll post the serie for final review.

 - Arnaud

> $ git ls-remote git://github.com/lacombar/linux-2.6.git | grep
> kbuild-implicit-parser-rule
> a483784894fcbba51be58afc4a2ff1373ed96ca0
> refs/heads/kbuild-implicit-parser-rule
> $ git show
> a483784894fcbba51be58afc4a2ff1373ed96ca0:scripts/genksyms/Makefile |
> grep FLAGS
> HOSTCFLAGS_parse.tab.o := -Wno-uninitialized -I$(src)
> $
>
> Michal
>
