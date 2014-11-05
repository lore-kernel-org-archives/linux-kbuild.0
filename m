Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews04.kpnxchange.com ([213.75.39.7]:58510 "EHLO
	cpsmtpb-ews04.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751447AbaKEKgc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Nov 2014 05:36:32 -0500
Message-ID: <1415183789.20372.243.camel@x220>
Subject: Re: [PATCH 1/2] kconfig: don't silently ignore unhandled characters
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 05 Nov 2014 11:36:29 +0100
In-Reply-To: <5458ED470200007800044DA7@mail.emea.novell.com>
References: <5458A4FC0200007800044AC1@mail.emea.novell.com>
	 <1415110006.20372.165.camel@x220>
	 <5458ED470200007800044DA7@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

On Tue, 2014-11-04 at 14:14 +0000, Jan Beulich wrote:
> >>> On 04.11.14 at 15:06, <pebolle@tiscali.nl> wrote:
> > On Tue, 2014-11-04 at 09:05 +0000, Jan Beulich wrote:
> >> @@ -920,7 +931,7 @@ static int input (void );
> >>  /* This used to be an fputs(), but since the string might contain NUL's,
> >>   * we now use fwrite().
> >>   */
> >> -#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
> >> +#define ECHO fwrite( zconftext, zconfleng, 1, zconfout )
> >>  #endif
> >>  
> >>  /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
> > 
> > But this hunk looks unrelated. Is this needed?
> 
> I think it should stay, even if my flex version may be slightly different
> from the one that was used originally. As above - it's simply a result
> of re-generating.

(This annoyed me enough to dive a bit deeper. This message is mainly to
archive my notes publicly.)

This #define was added in v3.1. See commit 2f76b358f9fb ("kconfig: regen
parser"). Commit explanations were probably a bit expensive then since
this is all the info we have: we don't know why this was done, nor how
(which program, which options, etc.).

Anyhow, I don't think ECHO is used anywhere. grepping for ECHO in
scripts/ finds dtc-lexer.lex.c_shipped, lex.lex.c_shipped, and this
file. In the other two _shipped files ECHO is actually used. So,
apparently it's not a bit of lex magic. The #define might as well be
removed.

I personally wouldn't bother to add this hunk, but who cares.


Paul Bolle

