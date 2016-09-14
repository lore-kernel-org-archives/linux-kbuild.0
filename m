Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dd34104.kasserver.com ([85.13.151.79]:48286 "EHLO
        dd34104.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752289AbcINHLl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Sep 2016 03:11:41 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
In-Reply-To: <CAAqcGHm-4VOfyLgKnqcrLd2F4=XxQs_NEaq-NvUXZpxv3e_P3g@mail.gmail.com>
References: <1473032617-21914-1-git-send-email-public_timo.s@silentcreek.de><CAAqcGHm-4VOfyLgKnqcrLd2F4=XxQs_NEaq-NvUXZpxv3e_P3g@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Update a few outdated and hardcoded strings
From: "Timo Sigurdsson" <public_timo.s@silentcreek.de>
Message-Id: <20160914071137.6EF4A6C80558@dd34104.kasserver.com>
Date: Wed, 14 Sep 2016 09:11:37 +0200 (CEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Riku Voipio schrieb am 13.09.2016 10:22:

> On 5 September 2016 at 02:43, Timo Sigurdsson
> <public_timo.s@silentcreek.de> wrote:
>> The builddeb script has some hardcoded references to linux version 2.6
>> which is ancient. Use a variable instead in order to keep in sync with
>> new releases and avoid the need to manually update this. In addition,
>> change the copyright notice to include the year 2016.
> 
> I think we can just drop all the "Provides" lines, the official debian
> packages don't provide
> anything, and nothing depends on these provided virtual packages either.

As far as Debian is concerned, that's true. However, Ubuntu's linux
packages have these "Provides" lines. But as I haven't used Ubuntu in a
while, I don't know if these are actually required for anything on Ubuntu
systems.

I'd be fine with any decision (keep or drop), I just don't wanna make the
call to drop them as I'm not aware about the implications on other Debian
based distributions.

Regards,

Timo


<snip>
