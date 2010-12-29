Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:34314 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753726Ab0L2Wcs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Dec 2010 17:32:48 -0500
Message-ID: <4D1BB709.2050308@suse.cz>
Date: Wed, 29 Dec 2010 23:32:41 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] fix undesirable side effect of adding "visible" menu
 attribute
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>	<20101216212614.GD21436@pobox.suse.cz>	<AANLkTi=Va4upUfgX8+kSKMOaepSGy3AVTA9az4OecvY4@mail.gmail.com>	<4D1AFD07.9030208@suse.cz> <AANLkTikLMMb_--+A7W7MPo=4bDh7MOq-G=wD+e+qw8NC@mail.gmail.com>
In-Reply-To: <AANLkTikLMMb_--+A7W7MPo=4bDh7MOq-G=wD+e+qw8NC@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Jan Beulich <JBeulich@novell.com>, linux-kbuild@vger.kernel.org, mchehab@redhat.com

On 29.12.2010 16:17, Arnaud Lacombe wrote:
> Hi,
> 
> On Wed, Dec 29, 2010 at 4:19 AM, Michal Marek <mmarek@suse.cz> wrote:
>> I'd like to have _some_ fix in 2.6.37, if Linus takes it. So unless you
>> come up with an alternate patch RSN, I'll apply Jan's patch and send a
>> pull request to Linus.
>>
> Please go on, the other solutions I had is more intrusive, and still
> need to be completed.

OK, applied Jan's patch to kbuild-2.6.git#rc-fixes.

Michal
