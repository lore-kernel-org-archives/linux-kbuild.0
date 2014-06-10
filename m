Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:61277 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751012AbaFJLRU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 07:17:20 -0400
Date: Tue, 10 Jun 2014 20:17:07 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
In-Reply-To: <5396E55D.8000202@suse.cz>
References: <20140610095016.GA5528@ravnborg.org> <5396E55D.8000202@suse.cz>
Message-Id: <20140610201706.9614.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

Hi Michal, Sam,

On Tue, 10 Jun 2014 13:00:45 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2014-06-10 11:50, Sam Ravnborg wrote:
> >>
> >> The variable is assinged with a ":=", not a "?=", so you can't change it
> >> from outside, can you?
> > 
> > Variables assigned with ":=" can be changed like this:
> > 
> > $ cat Makefile
> > FOO := fisk
> > $(info FOO=$(FOO))
> > all:
> > 	@:
> > 
> > $ FOO=bar make
> > FOO=fisk
> > 
> > $ make FOO=bar
> > FOO=bar
> > 
> > 
> > The first is the same as using an environment variable.
> > The latter is a special make syntax.
> 
> I see. But do we want to encourage people to change the value? IMO There
> should be some "change this variable only if you know what you are
> doing" warning.
> 
> Michal

IMHO:
If all shell scripts invoked by $KBUILD_SHELL should be sh-compatible,
 "KBUILD_SHELL" should always be set to "/bin/sh" and
users should not change it.

I still don't understand why bash is preferable for KBUILD_SHELL.


Best Regards
Masahiro Yamada

