Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:58229 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750956AbaFIVTE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 17:19:04 -0400
Date: Mon, 9 Jun 2014 23:18:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: rename CONFIG_SHELL to KBUILD_SHELL
Message-ID: <20140609211858.GA2025@ravnborg.org>
References: <1402317082-21184-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140609181526.GA1414@ravnborg.org>
 <53961E26.5080704@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53961E26.5080704@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

On Mon, Jun 09, 2014 at 10:50:46PM +0200, Michal Marek wrote:
> Dne 9.6.2014 20:15, Sam Ravnborg napsal(a):
> > And please cc: the x86 people - thay have some patches that
> > uses CONFIG_SHELL IIRC.
> 
> Do you remember which patches? Looking at
> 
>   git diff kbuild/kbuild linux-next -- arch/x86
> 
> The only occurrence of CONFIG_SHELL is in the rule for make kvmconfig.
> Which is a conflict that is trivially solved.
Yep - these were the ones I had in mind.

	Sam
