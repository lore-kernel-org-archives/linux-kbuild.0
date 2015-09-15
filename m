Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34946 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751961AbbIOE3R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Sep 2015 00:29:17 -0400
Received: by pacfv12 with SMTP id fv12so167217005pac.2
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2015 21:29:17 -0700 (PDT)
Subject: Re: [PATCH] kbuild: llvmlinux: Set appropriate compiler-flag for
 CONFIG_CC_OPTIMIZE_FOR_SIZE
References: <1442287188-11326-1-git-send-email-sedat.dilek@gmail.com>
 <55F7931F.2020100@converseincode.com>
 <CA+icZUX5D__B6sP5YYZn1+Yob+aq+g586-ZAeiN0NpjxpChraw@mail.gmail.com>
From: Behan Webster <behanw@converseincode.com>
Message-ID: <55F79E9A.40308@converseincode.com>
Date: Mon, 14 Sep 2015 22:29:14 -0600
MIME-Version: 1.0
In-Reply-To: <CA+icZUX5D__B6sP5YYZn1+Yob+aq+g586-ZAeiN0NpjxpChraw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 09/14/15 22:07, Sedat Dilek wrote:
> On Tue, Sep 15, 2015 at 5:40 AM, Behan Webster
> <behanw@converseincode.com> wrote:
>> I haven't upstreamed this patch yet because we are still characterizing its
>> effects on other architectures.
> Then embed this information into the changelog of *your* patch.
It's in our tree/build system, as a work in progress. Which is why I 
haven't upstreamed it yet.

> So what is *your* solution in case of CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> (OptLevel '-Os' is wrong, '-Oz' is correct)?
I don't have one yet, which is precisely why I haven't upstreamed it yet.

Sedat, why don't you try working with us instead of making demands and 
accusing people?

Behan

-- 
Behan Webster
behanw@converseincode.com

