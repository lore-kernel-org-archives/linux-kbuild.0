Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36457 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758069Ab3DXW2J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Apr 2013 18:28:09 -0400
Message-ID: <51785C72.5040206@suse.cz>
Date: Thu, 25 Apr 2013 00:28:02 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] kconfig: implement KCONFIG_PROBABILITY for randconfig
References: <cover.1366665921.git.yann.morin.1998@free.fr> <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr> <20130423215044.GA20111@free.fr> <20130424175648.GA24710@free.fr>
In-Reply-To: <20130424175648.GA24710@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Peter Korsgaard <jacmet@uclibc.org>

Dne 24.4.2013 19:56, Yann E. MORIN napsal(a):
> Michal, All,
> 
> On Tue, Apr 23, 2013 at 11:50:44PM +0200, Yann E. MORIN wrote:
>> On Mon, Apr 22, 2013 at 11:31:24PM +0200, Yann E. MORIN wrote:
>>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Introduce a KCONFIG_PROBABILITY environment variable to tweak the
>>> probability between 0 (all options off) and 100 (all options on).
>>
>> Please, drop this patch: randconfig is utterly broken is a very subtle
>> way (even without this patch applied), which I still have to track down,
>> and I'm not confident I can find and properly fis it before the end of
> [--SNIP--]
>> More on this later. For now, just drop this probability patch. The other
>> patches are still good for 3.10.
> 
> Michal, I have something interesting now that I'm testing. If you did
> not already apply the rest of the series, just hold-on just a bit more,
> I'll re-spin a new version of the series later tonight.

OK, I'll wait.

Michal
