Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34822 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbfCRTSr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 15:18:47 -0400
Date: Mon, 18 Mar 2019 15:18:43 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v2 0/8] klp-convert
Message-ID: <20190318191843.GA22702@redhat.com>
References: <20190301141313.15057-1-jmoreira@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301141313.15057-1-jmoreira@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On Fri, Mar 01, 2019 at 11:13:05AM -0300, Joao Moreira wrote:
> Livepatches may use symbols which are not contained in its own scope,
> and, because of that, may end up compiled with relocations that will
> only be resolved during module load. Yet, when the referenced symbols are
> not exported, solving this relocation requires information on the object
> that holds the symbol (either vmlinux or modules) and its position inside
> the object, as an object may contain multiple symbols with the same name.
> Providing such information must be done accordingly to what is specified
> in Documentation/livepatch/module-elf-format.txt.
> 
> Currently, there is no trivial way to embed the required information as
> requested in the final livepatch elf object. klp-convert solves this
> problem in two different forms: (i) by relying on a symbol map, which is
> built during kernel compilation, to automatically infers the relocation
> targeted symbol, and, when such inference is not possible (ii) by using
> annotations in the elf object to convert the relocation accordingly to
> the specification, enabling it to be handled by the livepatch loader.
> 
> Given the above, add support for symbol mapping in the form of
> Symbols.list file; add klp-convert tool; integrate klp-convert tool into
> kbuild; make livepatch modules discernible during kernel compilation
> pipeline; add data-structure and macros to enable users to annotate
> livepatch source code; make modpost stage compatible with livepatches;
> update livepatch-sample and update documentation.
> 
> The patch was tested under three use-cases:
> 
> use-case 1: There is a relocation in the lp that can be automatically
> resolved by klp-convert (tested by removing the annotations from
> samples/livepatch/livepatch-annotated-sample.c)
> 
> use-case 2: There is a relocation in the lp that cannot be automatically
> resolved, as the name of the respective symbol appears in multiple
> objects. The livepatch contains an annotation to enable a correct
> relocation - reproducible with this livepatch sample:
> www.livewire.com.br/suse/klp/livepatch-sample.1.c
> 
> use-case 3: There is a relocation in the lp that cannot be automatically
> resolved similarly as 2, but no annotation was provided in the livepatch,
> triggering an error during compilation - reproducible with this livepatch
> sample: www.livewire.com.br/suse/klp/livepatch-sample.2.c
> 
> In comparison with v1, this version of the patch-set:
> - was rebased to kernel 4.19
> - adds a Symbols.list versioning information
> - brings bug fixes and code improvements to klp-convert sources
> 
> This is a patch-set repost, given that a typo in a mail address prevented
> the original submission from being posted to lkml.
> 
> [ ... snip ... ]

Hi Joao,

Apologies for taking so long to get to this patchset, but I finally
spent last week reviewing and testing.  My goal was to write a klp
self-test based on the implementation and your sample module.  Along the
way I spotted a few minor bugs and other small suggestions.  Instead of
dumping a bunch of code or patch content in my replies, I posted my
rebase and modified branch here:

  https://github.com/joe-lawrence/linux/tree/klp-convert-v2-rebase-review

I added subject line [squash] tags to individual commits that should be
considered fixups for patches in this set.  Those commit logs also
contain [joe: description] tags and my sign-offs for that purpose as
well.

Hopefully this form of feedback will be easy to digest.  I'll reply to
the individual patchs here with high-level comments and a pointer to the
corresponding github patch.  Let me know if there are any questions.  If
it is easier to simply repost as a v3 with those changes, I can do that
as well -- whichever method is easier for you.

I'll also take comments on my work-in-progress self-test for
klp-convert:

  [new] livepatch/selftests: add klp-convert 
  https://github.com/torvalds/linux/commit/b0d858b9356d3c909096509a0f18e092b739b44f

At the moment, it consists of two livepatch modules (I'd prefer to
consolidate, but ran into an issue with klp-convert and multiple object
files) and verifies that livepatch can correctly resolve sympos of 0/1,
2 for unique/non-uniquely named strings and functions.

-- Joe
