Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:42418 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756075Ab2DLTwu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Apr 2012 15:52:50 -0400
Date: Thu, 12 Apr 2012 21:52:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] Add CONFIG_READABLE_ASM
Message-ID: <20120412195248.GA30631@merkur.ravnborg.org>
References: <1332960678-11879-1-git-send-email-andi@firstfloor.org> <1332960678-11879-2-git-send-email-andi@firstfloor.org> <CAMuHMdVX28zeebzN6277B5p2b=9s-Q06i01o5AHPyXAuKMigGQ@mail.gmail.com> <20120412194016.GA30558@merkur.ravnborg.org> <CAMuHMdXfpvprGD18_YYyctfrAk6iRJonWFGFRf9oSaH0u0zfhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXfpvprGD18_YYyctfrAk6iRJonWFGFRf9oSaH0u0zfhw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, Andi Kleen <ak@linux.intel.com>

On Thu, Apr 12, 2012 at 09:47:19PM +0200, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> On Thu, Apr 12, 2012 at 21:40, Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Thu, Apr 12, 2012 at 09:08:36PM +0200, Geert Uytterhoeven wrote:
> >> On Wed, Mar 28, 2012 at 20:51, Andi Kleen <andi@firstfloor.org> wrote:
> >> > +ifdef CONFIG_READABLE_ASM
> >> > +# Disable optimizations that make assembler listings hard to read.
> >> > +# reorder blocks reorders the control in the function
> >> > +# ipa clone creates specialized cloned functions
> >> > +# partial inlining inlines only parts of functions
> >> > +KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
> >> > +                 $(call cc-option,-fno-ipa-cp-clone,) \
> >> > +                 $(call cc-option,-fno-partial-inlining)
> >> > +endif
> >
> > Could people move to this century and drop these ugly "\" line-continuations please...
> > People seems to get along in C without but think they should be used in Makefiles..
> 
> Not without an additional patch for make:
> 
> Makefile:575: *** missing separator (did you mean TAB instead of 8
> spaces?).  Stop.

I meant like this:

KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks)
KBUILD_CFLAGS += $(call cc-disable-warning,-fno-ipa-cp-clone)
KBUILD_CFLAGS += $(call cc-option,-fno-partial-inlining)

	Sam
