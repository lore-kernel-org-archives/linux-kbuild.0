Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44035 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751676Ab0L2JTG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Dec 2010 04:19:06 -0500
Message-ID: <4D1AFD07.9030208@suse.cz>
Date: Wed, 29 Dec 2010 10:19:03 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] fix undesirable side effect of adding "visible" menu
 attribute
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>	<20101216212614.GD21436@pobox.suse.cz> <AANLkTi=Va4upUfgX8+kSKMOaepSGy3AVTA9az4OecvY4@mail.gmail.com>
In-Reply-To: <AANLkTi=Va4upUfgX8+kSKMOaepSGy3AVTA9az4OecvY4@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Jan Beulich <JBeulich@novell.com>, linux-kbuild@vger.kernel.org, mchehab@redhat.com

On 17.12.2010 00:49, Arnaud Lacombe wrote:
> Hi,
> 
> On Thu, Dec 16, 2010 at 4:26 PM, Michal Marek <mmarek@suse.cz> wrote:
>> On Thu, Dec 09, 2010 at 08:11:38AM +0000, Jan Beulich wrote:
>>> This lead to non-selected, non-user-selectable options to be written
>>> out to .config. This is not only pointless, but also preventing the
>>> user to be prompted should any of those options eventually become
>>> visible (e.g. by de-selecting the *_AUTO options the "visible"
>>> attribute was added for.
>>>
>>> Furthermore it is quite logical for the "visible" attribute of a menu
>>> to control the visibility of all contained prompts, which is what the
>>> patch does.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@novell.com>
>>
>> It also fixes the issue that all{mod,yes}config set some options from
>> the invisible menus that cannot be selected interactively (e.g.
>> I2C_ALGOPCF, that is only selected by I2C_ELEKTOR on !SMP), so this
>> patch is
>>
>> Acked-by: Michal Marek <mmarek@suse.cz>
>>
>> unless Arnaud has a good reason not to take it.
>>
> Actually, I wanted to keep the parsing and tree construction as simple
> as possible. Fix-up like that should really happen in menu_finalize()
> as we will anyway traverse all the menus once again there and it is
> already doing all kind of dependency simplification, so that would
> keep everything at the same place.
> 
> Say that if I do not show up with a version which would move this in
> menu_finalize() by the end of the week (sooner if you want that for
> .37), feel free to forget about this mail. Hopefully, I'll not move
> back to Linux this week-end, so I should have the time to do that.

I'd like to have _some_ fix in 2.6.37, if Linus takes it. So unless you
come up with an alternate patch RSN, I'll apply Jan's patch and send a
pull request to Linus.

Michal
