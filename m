Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:51228 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751544Ab0KYTJI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Nov 2010 14:09:08 -0500
Date: Thu, 25 Nov 2010 20:09:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/5] kconfig: add an option to determine a menu's
	visibility
Message-ID: <20101125190906.GA20087@merkur.ravnborg.org>
References: <4CD300AC.3010708@redhat.com> <1289079027-3037-2-git-send-email-lacombar@gmail.com> <AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Michal Marek <mmarek@suse.cz>

On Thu, Nov 25, 2010 at 12:06:46PM -0500, Arnaud Lacombe wrote:
> Hi folks,
> 
> On Sat, Nov 6, 2010 at 5:30 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> > This option is aimed to add the possibility to control a menu's visibility
> > without adding dependency to the expression to all the submenu.
> >
> > Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> > ---
> >  scripts/kconfig/expr.h      |    1 +
> >  scripts/kconfig/lkc.h       |    1 +
> >  scripts/kconfig/menu.c      |   11 +++++++++++
> >  scripts/kconfig/zconf.gperf |    1 +
> >  scripts/kconfig/zconf.y     |   21 ++++++++++++++++++---
> >  5 files changed, 32 insertions(+), 3 deletions(-)
> >
> As there seem to be no interested from Michal to either, ACK, NACK, or

Hi Arnaud.
I have these sitting in my TODO pile.
But I have other things that I need to do first and I expect
these other things to take a couple of weeks.
[Not Linux related - just busy at my day-job/night-job]

	Sam
