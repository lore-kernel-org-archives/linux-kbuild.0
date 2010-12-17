Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57361 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153Ab0LQCDa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Dec 2010 21:03:30 -0500
Received: by iyi12 with SMTP id 12so117704iyi.19
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Dec 2010 18:03:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=Va4upUfgX8+kSKMOaepSGy3AVTA9az4OecvY4@mail.gmail.com>
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
	<20101216212614.GD21436@pobox.suse.cz>
	<AANLkTi=Va4upUfgX8+kSKMOaepSGy3AVTA9az4OecvY4@mail.gmail.com>
Date: Thu, 16 Dec 2010 21:03:29 -0500
Message-ID: <AANLkTim+63yNuMqUm5RkDXHHBw8mN-wo4=TsnJMjGBXL@mail.gmail.com>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible" menu attribute
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jan Beulich <JBeulich@novell.com>, linux-kbuild@vger.kernel.org, mchehab@redhat.com

Hi all,

On Thu, Dec 16, 2010 at 6:49 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
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
hum, I just thought of something. Instead of adding more complexity to
the menu children, why would {,m,n,q}conf descend to these submenus at
first. they should just ignore all the childs if the parent is not
meant to be visible and go to the next node on the same level. When I
close the front door of my house, I do expect people to stop right
there, not continue to check any door I may have left open inside.

 - Arnaud
