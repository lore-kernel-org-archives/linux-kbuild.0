Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dd34104.kasserver.com ([85.13.151.79]:57140 "EHLO
        dd34104.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753197AbcINJyV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Sep 2016 05:54:21 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
In-Reply-To: <CAAqcGHnxAa4kxbVt=PDhn1dkfcAwyL3jHG4fGihpjJ9E35LjUA@mail.gmail.com>
References: <1473032617-21914-1-git-send-email-public_timo.s@silentcreek.de> <CAAqcGHm-4VOfyLgKnqcrLd2F4=XxQs_NEaq-NvUXZpxv3e_P3g@mail.gmail.com> <20160914071137.6EF4A6C80558@dd34104.kasserver.com><CAAqcGHnxAa4kxbVt=PDhn1dkfcAwyL3jHG4fGihpjJ9E35LjUA@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Update a few outdated and hardcoded strings
From: "Timo Sigurdsson" <public_timo.s@silentcreek.de>
Message-Id: <20160914095418.A9E216C80558@dd34104.kasserver.com>
Date: Wed, 14 Sep 2016 11:54:18 +0200 (CEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org

Hi,

Riku Voipio schrieb am 14.09.2016 10:56:

> On 14 September 2016 at 10:11, Timo Sigurdsson
> <public_timo.s@silentcreek.de> wrote:
>>> On 5 September 2016 at 02:43, Timo Sigurdsson
>>> <public_timo.s@silentcreek.de> wrote:
>>>> The builddeb script has some hardcoded references to linux version 2.6
>>>> which is ancient. Use a variable instead in order to keep in sync with
>>>> new releases and avoid the need to manually update this. In addition,
>>>> change the copyright notice to include the year 2016.
>>>
>>> I think we can just drop all the "Provides" lines, the official debian
>>> packages don't provide
>>> anything, and nothing depends on these provided virtual packages either.
>>
>> As far as Debian is concerned, that's true. However, Ubuntu's linux
>> packages have these "Provides" lines. But as I haven't used Ubuntu in a
>> while, I don't know if these are actually required for anything on Ubuntu
>> systems.
> 
> Ubuntu has "linux-image" but not "linux-image-$majorversion". No
> reverse dependencies on either (apt-cache rdepends). Let me ask the
> other way around - why do you need linux-image-4.9 in your provides?

I don't need it. I just wanted the strings to be up-to-date (merely a
cosmetic issue). If the consensus is to drop the lines entirely, that's
good enough for me.

One reason why it didn't occur to me to get rid of the lines was that IIRC
at least a while back there were Ubuntu packages relying on a
"linux-headers" package (without a version number). As it's quite some
time ago that I actually used Ubuntu, I'm not entirely sure whether
that was or still is the case.

> 
>> I'd be fine with any decision (keep or drop), I just don't wanna make the
>> call to drop them as I'm not aware about the implications on other Debian
>> based distributions.
> 
> I'd like to keep builddeb script simple. If there is some evidence
> that something is still using "linux-image" or "linux-headers" virtual
> package, we can keep them in the "provides" line. dropping the
> linux-image-2.6 and linux-headers-2.6 bits should however be preferred
> over starting to updating the dynamically. Especially since we've
> managed all the way from 2.6 ... 4.7 without anyone needing it.

Dropping the version references sounds allright to me. Maybe someone else
can tell whether the virutal packages without version suffix are still
used somewhere. But just to be safe, I'd rather keep those unless it's
certain that they aren't needed anymore (nobody speaking up and saying
these virtual packages are still in use, doesn't necessarily mean that
they aren't used in fact).

Regards,

Timo
