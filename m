Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:55410 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753878AbaFICVJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 22:21:09 -0400
Date: Mon, 09 Jun 2014 11:21:05 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 0/7] scripts: objdiff: various clean-up, fix and new features
In-Reply-To: <20140606153851.GM8664@titan.lakedaemon.net>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com> <20140606153851.GM8664@titan.lakedaemon.net>
Message-Id: <20140609112104.95AF.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: linux-kbuild@vger.kernel.org

Hi Jason,

On Fri, 6 Jun 2014 11:38:51 -0400
Jason Cooper <jason@lakedaemon.net> wrote:

> Masahiro,
> 
> On Fri, May 30, 2014 at 08:11:48PM +0900, Masahiro Yamada wrote:
> > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > 
> > Masahiro Yamada (7):
> >   scripts: objdiff: get the path to .tmp_objdiff more simply
> >   scripts: objdiff: direct error messages to stderr
> >   scripts: objdiff: remove unnecessary code
> >   scripts: objdiff: improve path flexibility for record command
> >   scripts: objdiff: change the extension of disassembly from .o to .dis
> >   scripts: objdiff: fix a comment
> >   scripts: objdiff: support directories for the augument of record
> >     command
> > 
> >  scripts/objdiff | 74 +++++++++++++++++++++++++++++++++++----------------------
> >  1 file changed, 46 insertions(+), 28 deletions(-)
> 
> Other than the few minor things I noted on the individual patches,
> 
> Acked-by: Jason Cooper <jason@lakedaemon.net>
> 
> Great patch series!
> 
> thx,
> 
> Jason.

Thanks for your review!

I've sent v2 with minor fixes:
  - s/reltive/relative/
  - s/clearer/cleaner/


Best Regards
Masahiro Yamada

