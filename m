Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:45898 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752750AbaFJBLZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 21:11:25 -0400
Date: Tue, 10 Jun 2014 10:11:09 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: rename CONFIG_SHELL to KBUILD_SHELL
In-Reply-To: <53963B97.1060807@suse.cz>
References: <20140609211858.GA2025@ravnborg.org> <53963B97.1060807@suse.cz>
Message-Id: <20140610101109.95ED.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

Hi Michal,


On Tue, 10 Jun 2014 00:56:23 +0200
Michal Marek <mmarek@suse.cz> wrote:

> Dne 9.6.2014 23:18, Sam Ravnborg napsal(a):
> > On Mon, Jun 09, 2014 at 10:50:46PM +0200, Michal Marek wrote:
> >> Dne 9.6.2014 20:15, Sam Ravnborg napsal(a):
> >>> And please cc: the x86 people - thay have some patches that
> >>> uses CONFIG_SHELL IIRC.
> >>
> >> Do you remember which patches? Looking at
> >>
> >>   git diff kbuild/kbuild linux-next -- arch/x86
> >>
> >> The only occurrence of CONFIG_SHELL is in the rule for make kvmconfig.
> >> Which is a conflict that is trivially solved.
> > Yep - these were the ones I had in mind.
> 
> Thanks, this is a trivial conflict. I'll have one more look and apply
> the rename tomorrow.


I found a typo in the commit description.

s/Is is impossible/It is impossible/

Could you fix it when you apply this patch, please?


Thanks in advance.


Best Regards
Masahiro Yamada

