Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44273 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751158AbaFIUuy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 16:50:54 -0400
Message-ID: <53961E26.5080704@suse.cz>
Date: Mon, 09 Jun 2014 22:50:46 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: rename CONFIG_SHELL to KBUILD_SHELL
References: <1402317082-21184-1-git-send-email-yamada.m@jp.panasonic.com> <20140609181526.GA1414@ravnborg.org>
In-Reply-To: <20140609181526.GA1414@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

Dne 9.6.2014 20:15, Sam Ravnborg napsal(a):
> And please cc: the x86 people - thay have some patches that
> uses CONFIG_SHELL IIRC.

Do you remember which patches? Looking at

  git diff kbuild/kbuild linux-next -- arch/x86

The only occurrence of CONFIG_SHELL is in the rule for make kvmconfig.
Which is a conflict that is trivially solved.

Michal
