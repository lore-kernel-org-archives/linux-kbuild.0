Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:15671 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932477Ab2EVVTo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 May 2012 17:19:44 -0400
Date: Tue, 22 May 2012 17:19:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: kconfig-frontends-3.4.0-0 released
Message-ID: <20120522211941.GA30024@home.goodmis.org>
References: <201205222221.05548.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201205222221.05548.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 22, 2012 at 10:21:05PM +0200, Yann E. MORIN wrote:
> Hello All!
> 
> I'm pleased to announce the release of kconfig-frontends 3.4.0-0!
> Go download it there:
>     http://ymorin.is-a-geek.org/download/kconfig-frontends/kconfig-frontends-3.4.0-0.tar.xz
>     http://ymorin.is-a-geek.org/download/kconfig-frontends/kconfig-frontends-3.4.0-0.tar.bz2
> 
> The kconfig-frontends package provides the kconfig parser, as well as all the
> kconfig frontends and utilities, packaged using the traditional autotools, so
> the kconfig infrastructure is easy to deploy, either locally or system-wide.
> 
> What's new since 3.3.0-0:
>   - all programs are intalled with the 'kconfig-' prefix by default
>   - the kconfig documentation has been added
>   - the parser's headers are isntalled into their own sub-dir
>   - some side utilities have been added from the Linux kernel tree:
>     - kconfig-diff      show differences between two .config files

I'm curious, how is this different than scripts/diffconfig ?

-- Steve

>     - kconfig-gettext   prepare catalog of options strings for L10n
>     - kconfig-merge     merge .config fragments
>     - kconfig-tweak     get and set .config optiond from the command line
> 
