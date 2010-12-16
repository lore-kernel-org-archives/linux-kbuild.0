Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:50665 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752222Ab0LPXtH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Dec 2010 18:49:07 -0500
Received: by iwn9 with SMTP id 9so126191iwn.19
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Dec 2010 15:49:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101216212614.GD21436@pobox.suse.cz>
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
	<20101216212614.GD21436@pobox.suse.cz>
Date: Thu, 16 Dec 2010 18:49:06 -0500
Message-ID: <AANLkTi=Va4upUfgX8+kSKMOaepSGy3AVTA9az4OecvY4@mail.gmail.com>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible" menu attribute
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jan Beulich <JBeulich@novell.com>, linux-kbuild@vger.kernel.org, mchehab@redhat.com

Hi,

On Thu, Dec 16, 2010 at 4:26 PM, Michal Marek <mmarek@suse.cz> wrote:
> On Thu, Dec 09, 2010 at 08:11:38AM +0000, Jan Beulich wrote:
>> This lead to non-selected, non-user-selectable options to be written
>> out to .config. This is not only pointless, but also preventing the
>> user to be prompted should any of those options eventually become
>> visible (e.g. by de-selecting the *_AUTO options the "visible"
>> attribute was added for.
>>
>> Furthermore it is quite logical for the "visible" attribute of a menu
>> to control the visibility of all contained prompts, which is what the
>> patch does.
>>
>> Signed-off-by: Jan Beulich <jbeulich@novell.com>
>
> It also fixes the issue that all{mod,yes}config set some options from
> the invisible menus that cannot be selected interactively (e.g.
> I2C_ALGOPCF, that is only selected by I2C_ELEKTOR on !SMP), so this
> patch is
>
> Acked-by: Michal Marek <mmarek@suse.cz>
>
> unless Arnaud has a good reason not to take it.
>
Actually, I wanted to keep the parsing and tree construction as simple
as possible. Fix-up like that should really happen in menu_finalize()
as we will anyway traverse all the menus once again there and it is
already doing all kind of dependency simplification, so that would
keep everything at the same place.

Say that if I do not show up with a version which would move this in
menu_finalize() by the end of the week (sooner if you want that for
.37), feel free to forget about this mail. Hopefully, I'll not move
back to Linux this week-end, so I should have the time to do that.

 - Arnaud
