Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:34903 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755993AbcINI4V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Sep 2016 04:56:21 -0400
Received: by mail-wm0-f49.google.com with SMTP id i130so36381067wmf.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Sep 2016 01:56:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914071137.6EF4A6C80558@dd34104.kasserver.com>
References: <1473032617-21914-1-git-send-email-public_timo.s@silentcreek.de>
 <CAAqcGHm-4VOfyLgKnqcrLd2F4=XxQs_NEaq-NvUXZpxv3e_P3g@mail.gmail.com> <20160914071137.6EF4A6C80558@dd34104.kasserver.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Wed, 14 Sep 2016 11:56:19 +0300
Message-ID: <CAAqcGHnxAa4kxbVt=PDhn1dkfcAwyL3jHG4fGihpjJ9E35LjUA@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Update a few outdated and hardcoded strings
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Timo Sigurdsson <public_timo.s@silentcreek.de>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 14 September 2016 at 10:11, Timo Sigurdsson
<public_timo.s@silentcreek.de> wrote:
>> On 5 September 2016 at 02:43, Timo Sigurdsson
>> <public_timo.s@silentcreek.de> wrote:
>>> The builddeb script has some hardcoded references to linux version 2.6
>>> which is ancient. Use a variable instead in order to keep in sync with
>>> new releases and avoid the need to manually update this. In addition,
>>> change the copyright notice to include the year 2016.
>>
>> I think we can just drop all the "Provides" lines, the official debian
>> packages don't provide
>> anything, and nothing depends on these provided virtual packages either.
>
> As far as Debian is concerned, that's true. However, Ubuntu's linux
> packages have these "Provides" lines. But as I haven't used Ubuntu in a
> while, I don't know if these are actually required for anything on Ubuntu
> systems.

Ubuntu has "linux-image" but not "linux-image-$majorversion". No
reverse dependencies on either (apt-cache rdepends). Let me ask the
other way around - why do you need linux-image-4.9 in your provides?

> I'd be fine with any decision (keep or drop), I just don't wanna make the
> call to drop them as I'm not aware about the implications on other Debian
> based distributions.

I'd like to keep builddeb script simple. If there is some evidence
that something is still using "linux-image" or "linux-headers" virtual
package, we can keep them in the "provides" line. dropping the
linux-image-2.6 and linux-headers-2.6 bits should however be preferred
over starting to updating the dynamically. Especially since we've
managed all the way from 2.6 ... 4.7 without anyone needing it.

Riku
