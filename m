Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0199.hostedemail.com ([216.40.44.199]:55667 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729974AbfFYRh7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 13:37:59 -0400
Message-ID: <360e2cd7578450d1a24729bf4483d0e762c21dc5.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From: Joe Perches <joe@perches.com>
Date: Tue, 25 Jun 2019 10:37:54 -0700
In-Reply-To: <3e40f8c1-9699-2723-4e70-9e91ff256257@embeddedor.com>
References: <20190625160103.GA13133@embeddedor>
         <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
         <3e40f8c1-9699-2723-4e70-9e91ff256257@embeddedor.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, 2019-06-25 at 12:06 -0500, Gustavo A. R. Silva wrote:
> 
> On 6/25/19 11:52 AM, Joe Perches wrote:
> > On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
> > > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > > cases where we are expecting to fall through.
> > []
> > > This patch is part of the ongoing efforts to enable
> > > -Wimplicit-fallthrough.
> > 
> > Just enable the thing already.
> > 
> > If you stopped trying to do it all yourself, others
> 
> What are you talking about?
> 
> Anyone can enable it, I'm adding this to every commit:
> 
> Warning level 3 was used: -Wimplicit-fallthrough=3

No one does that by default and almost no one
is helping eliminate these.  Not even on th

Almost no one uses make W=<levels> either as it's
generally extremely noisy and can emit a lot of
false positives.

> And I'll send a PR with a proper patch for the Makefile
> during the next merge window.

That's great.

> If had the power I would have enabled this option since day 1,
> so every developer can take care of their own code.

You have always had the power to send a patch.

You also seem to believe the build needs to be
completely clean before enabling the switch.

I don't.

> Lately, you are not being of much help, Joe.

<smile> What kind of help are you expecting?

I'm not submitting patches adding fallthough comments
as I think that's not a good form.  I've said so
repeatedly.

I believe I suggested months ago you default enable
the compiler switch.

So it's up to you to either do it or not.
