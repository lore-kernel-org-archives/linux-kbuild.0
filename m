Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:53730 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055Ab0HQUvY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 16:51:24 -0400
Date: Tue, 17 Aug 2010 22:51:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: implement the `mainmenu' directive
Message-ID: <20100817205113.GA11658@merkur.ravnborg.org>
References: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com> <1282023725-20428-1-git-send-email-lacombar@gmail.com> <20100817203446.GC11592@merkur.ravnborg.org> <AANLkTi=Gd9=9dDsD9Q90OfiWpfeMx5Yn+2RjQ24_9eaB@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTi=Gd9=9dDsD9Q90OfiWpfeMx5Yn+2RjQ24_9eaB@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Aug 17, 2010 at 04:44:00PM -0400, Arnaud Lacombe wrote:
> Hi,
> 
> On Tue, Aug 17, 2010 at 4:34 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > Any particular reason not to use menu_warn() ?
> >
> I would need a valid `struct menu *' ? same argument for prop_warn() :)
> 
> > When you submit the final patch then please divide it in two.
> > One patch that contains the zconf.y changes (like you do here),
> > and then a subsequent patch that updates the relevant _shipped files.
> > This makes review so much easier.
> >
> It seemed you were saying you had a patch, quoting what you said in
> the beginning:
> 
> > I actually attempted to go the "struct property" way.
> > This looks much simpler and I like how straight forward it is.
> >
> 
> or did I wrongly understood ?
I had a patch but I lost it (read: git reset --hard in the wrong tree).
It would be simple to redo.

	Sam
