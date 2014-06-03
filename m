Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:63263 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753321AbaFCFrt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Jun 2014 01:47:49 -0400
Date: Tue, 03 Jun 2014 14:47:39 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] selinux, kbuild: remove unnecessary $(hostprogs-y) from clean-files
In-Reply-To: <5709743.58aAPSG601@sifl>
References: <1397702546-25349-1-git-send-email-yamada.m@jp.panasonic.com> <5709743.58aAPSG601@sifl>
Message-Id: <20140603144739.321C.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: selinux@tycho.nsa.gov, linux-kbuild@vger.kernel.org

Hi Paul Moore,

On Thu, 17 Apr 2014 21:41:53 -0400
Paul Moore <paul@paul-moore.com> wrote:

> On Thursday, April 17, 2014 11:42:26 AM Masahiro Yamada wrote:
> > Files added to hostprogs-y are cleaned. (See scripts/Makefile.clean)
> > Adding them to clean-files is redundant.
> > 
> > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > ---
> > 
> >  scripts/selinux/genheaders/Makefile | 1 -
> >  scripts/selinux/mdp/Makefile        | 2 +-
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> Acked-by: Paul Moore <paul@paul-moore.com>


It looks like this patch was not included into
GIT-PULL of "SELinux patches for 3.16".

Is it possible to apply this and send another pull request?

Best Regards
Masahiro Yamada

