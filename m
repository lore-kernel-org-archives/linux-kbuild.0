Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:27332 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbfDPNzF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Apr 2019 09:55:05 -0400
Subject: Re: [PATCH v3 0/9] klp-convert livepatch build tooling
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <452e0cc5-ea9b-1638-3557-17e12671e21e@redhat.com>
Date: Tue, 16 Apr 2019 09:55:00 -0400
MIME-Version: 1.0
In-Reply-To: <20190410155058.9437-1-joe.lawrence@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On 4/10/19 11:50 AM, Joe Lawrence wrote:
> Hi folks,
> 
> This is the third installment of the klp-convert tool for generating and
> processing livepatch symbols for livepatch module builds.  For those
> following along at home, archive links to previous versions:
> 
> RFC:
>    https://lore.kernel.org/lkml/cover.1477578530.git.jpoimboe@redhat.com/
> v2:
>    https://lore.kernel.org/lkml/f52d29f7-7d1b-ad3d-050b-a9fa8878faf2@redhat.com/
> 
> (Note that I don't see v2 archived at lore, but that is a link to the
> most recent subthread that lore did catch.)
> 
> 
> Livepatches may use symbols which are not contained in its own scope,
> and, because of that, may end up compiled with relocations that will
> only be resolved during module load. Yet, when the referenced symbols are
> not exported, solving this relocation requires information on the object
> that holds the symbol (either vmlinux or modules) and its position inside
> the object, as an object may contain multiple symbols with the same name.
> Providing such information must be done accordingly to what is specified
> in Documentation/livepatch/module-elf-format.txt.

Hi Miroslav,

I noticed that some binutils programs like gdb, objdump, etc. don't like 
the .ko kernel objects that we're generating from this patchset, 
specifically those with the additional '.klp.rela.<obj>..text' livepatch 
symbol relocation sections.

For reference, I opened a new bugzilla with more details here:
https://sourceware.org/bugzilla/show_bug.cgi?id=24456

And was about to ping the binutils mailing list about the assertion that 
is tripping in bfd/elf.c.  The thought occurred to me that you guys 
might already be carrying a patch to workaround this issue?

-- Joe
