Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0009.hostedemail.com ([216.40.44.9]:48564 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726791AbfFYRtG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 13:49:06 -0400
Message-ID: <9c0d4ed622d6b8e47e040d398f764d52a9ac396d.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From: Joe Perches <joe@perches.com>
Date: Tue, 25 Jun 2019 10:49:01 -0700
In-Reply-To: <201906251029.08B862130@keescook>
References: <20190625160103.GA13133@embeddedor>
         <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
         <201906251029.08B862130@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.ngsorg>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, 2019-06-25 at 10:31 -0700, Kees Cook wrote:
> On Tue, Jun 25, 2019 at 09:52:23AM -0700, Joe Perches wrote:
> > On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
> > > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > > cases where we are expecting to fall through.
> > []
> > > This patch is part of the ongoing efforts to enable
> > > -Wimplicit-fallthrough.
> > 
> > Just enable the thing already.
> 
> Linus has been pretty clear about not wanting warning options enabled
> without first fixing all the cases it warns about first.

Hey Kees.

I don't recall that particular tidbit.  Got a link?  

cheers, Joe
