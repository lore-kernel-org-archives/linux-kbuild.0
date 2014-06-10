Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:38756 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaFJJuW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 05:50:22 -0400
Date: Tue, 10 Jun 2014 11:50:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
Message-ID: <20140610095016.GA5528@ravnborg.org>
References: <1402368710-31648-1-git-send-email-yamada.m@jp.panasonic.com>
 <5396CF99.1070309@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5396CF99.1070309@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

> 
> The variable is assinged with a ":=", not a "?=", so you can't change it
> from outside, can you?

Variables assigned with ":=" can be changed like this:

$ cat Makefile
FOO := fisk
$(info FOO=$(FOO))
all:
	@:

$ FOO=bar make
FOO=fisk

$ make FOO=bar
FOO=bar


The first is the same as using an environment variable.
The latter is a special make syntax.

	Sam
