Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60364 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728032AbfDPNhj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Apr 2019 09:37:39 -0400
Subject: Re: [PATCH v3 0/9] klp-convert livepatch build tooling
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
 <20190416052422.GA7482@350D>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <57510765-be85-4f91-493b-f7213a7580f3@redhat.com>
Date: Tue, 16 Apr 2019 09:37:36 -0400
MIME-Version: 1.0
In-Reply-To: <20190416052422.GA7482@350D>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On 4/16/19 1:24 AM, Balbir Singh wrote:
> 
> Could we get some details with examples or a sample, sorry I might be dense
> and missing simple information. The problem being solved is not clear to
> me from the changelog.
> 

Hi Balbir,

I see that Miroslav has already pointed to documentation, samples and 
self-tests for the patchset, but here is a summary in my own words:

kpatch-build constructs livepatch kernel modules by comparing a 
reference build with a patched build, combing through ELF object 
sections and extracting new and changed sections that include patched code.

An alternative approach is "source-based", in which a livepatch kernel 
module is built (mostly entirely) using the kernel's build 
infrastructure.  Sources for a livepatch are gathered ahead of time and 
then built like an ordinary kernel module.

In either approach, there lies the problem of symbol visibility: how can 
a livepatch resolve symbols that a kernel module ordinarily can't.  For 
example, file local or simply unexported symbols in across the kernel 
and other modules.  Enter the concept of "livepatch symbols" described 
in module-elf-format.txt.

kpatch-build already creates such "livepatch symbols" (see its 
create_klp_relasecs_and_syms()) and the livepatching core kernel code 
already knows how resolve such symbols at klp_object patch time (see 
klp_write_object_relocations()).

The klp-convert tool and this supporting patchset would empower 
source-based-constructed livepatch modules to do the same.

-- Joe
