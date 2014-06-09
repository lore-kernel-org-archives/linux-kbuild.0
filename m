Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45789 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932701AbaFIW4Z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 18:56:25 -0400
Message-ID: <53963B97.1060807@suse.cz>
Date: Tue, 10 Jun 2014 00:56:23 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: rename CONFIG_SHELL to KBUILD_SHELL
References: <1402317082-21184-1-git-send-email-yamada.m@jp.panasonic.com> <20140609181526.GA1414@ravnborg.org> <53961E26.5080704@suse.cz> <20140609211858.GA2025@ravnborg.org>
In-Reply-To: <20140609211858.GA2025@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

Dne 9.6.2014 23:18, Sam Ravnborg napsal(a):
> On Mon, Jun 09, 2014 at 10:50:46PM +0200, Michal Marek wrote:
>> Dne 9.6.2014 20:15, Sam Ravnborg napsal(a):
>>> And please cc: the x86 people - thay have some patches that
>>> uses CONFIG_SHELL IIRC.
>>
>> Do you remember which patches? Looking at
>>
>>   git diff kbuild/kbuild linux-next -- arch/x86
>>
>> The only occurrence of CONFIG_SHELL is in the rule for make kvmconfig.
>> Which is a conflict that is trivially solved.
> Yep - these were the ones I had in mind.

Thanks, this is a trivial conflict. I'll have one more look and apply
the rename tomorrow.

Michal
