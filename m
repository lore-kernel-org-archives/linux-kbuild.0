Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews06.kpnxchange.com ([213.75.39.9]:56097 "EHLO
	cpsmtpb-ews06.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751882AbbAVIfr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2015 03:35:47 -0500
Message-ID: <1421915745.13638.27.camel@x220>
Subject: Re: [PATCH] [RFC] kconfig: menuconfig make "Selected by:" readable
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 22 Jan 2015 09:35:45 +0100
In-Reply-To: <54C05F33.6070703@infradead.org>
References: <1421881250.13638.10.camel@x220>
	 <54C05F33.6070703@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Wed, 2015-01-21 at 18:23 -0800, Randy Dunlap wrote:
> On 01/21/15 15:00, Paul Bolle wrote:
> > rev_dep expressions can get rather unwieldy, especially if a symbol is
> > selected by more than a handful of other symbols. Ie, it's possible to
> > have near endless expressions like:
> >    A && B && !C || D || F && (G || H) || [...]
> > 
> > Chop these expressions into actually readable chunks:
> >    - A && B && !C
> >    - D
> >    - F && (G || H)
> >    - [...]
> > 
> > Ie, transform the top level "||" tokens into newlines and prepend each
> > line with a minus. This makes the "Selected by:" blurb much easier to
> > read.
> 
> I agree that something like this needs to be done.
> 
> After reading these expressions for a few years, I can handle them OK, but
> I expect that I look at them more than most people do (with the exception of Paul).

That's a problem with a broader scope. The specific problem this RFC
targets is neatly demonstrated by this screenshot: 
    Symbol: SERIAL_CORE_CONSOLE [=n]
    Type  : boolean
     Defined at drivers/tty/serial/Kconfig:805
  Depends on: TTY [=n] && HAS_IOMEM [=y]
  Selected by: SERIAL_8250_CONSOLE [=n] && TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n]=y || SERIAL_AMBA_PL010_CONSOLE [=n] && [...]

That line ends about two meters to the right of your screen. Really.

> Here is another confusing one, at least to me:
> [This is for LBDAF on a 64-biy x86 kernel config.]
> 
> Depends on: BLOCK [=y] && !64BIT [=y]
> 
> I guess that the value [y,m,n] inside the square brackets is always(?) the
> symbol value (64BIT) and not the expression value (!64BIT), but that isn't
> always clear IMO.

I think you got that right. I guess the entire screen for LBDAF looked
like this _hand edited_ example:
    Symbol: LBDAF [=n]                                      
    Type  : boolean                                         
    Prompt: Support for large (2TB+) block devices and files
      Location:                                             
    (1) -> Enable the block layer (BLOCK [=y])              
      Defined at block/Kconfig:26                           
      Depends on: BLOCK [=y] && !64BIT [=y]                 

In this case 64BIT is set to 'y' (otherwise LBDAF would have been 'y').
This isn't a bug issue, of course, but I still can see how this can be
confusing. Perhaps the last line should read:
      Unmet dependency on: BLOCK [=y] && !64BIT [=y]

Would that help? Or would 
      Depends on: BLOCK [=y] && !64BIT [=n]

(ie, print the value if "!64BIT") be clearer?

> > Not-yet-signed-off-by: Paul Bolle <pebolle@tiscali.nl>

I'm glad I added that!

> > Today I found myself wondering why a certain Kconfig was selected.
> > Currently menuconfig's help is of no use in complicated cases. Please
> > look at the help of USB or CRYPTO to see what I mean.
> > 
> > This is a _hack_ to show what might be a better way to do this. It
> > parses a stringified version of the reverse dependency, and not the
> > actual reverse dependecy expression. But that was easier to cobble
> > together.
> > 
> > One cool improvement would be to change to minus in front of the
> > subexpressions to Y or M for those that actually set the symbol. Anyhow,
> > other suggestions and feedback is welcome.
> > 
> >  scripts/kconfig/menu.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 81 insertions(+), 2 deletions(-)


Paul Bolle

