Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55170 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750773AbaFJLAr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 07:00:47 -0400
Message-ID: <5396E55D.8000202@suse.cz>
Date: Tue, 10 Jun 2014 13:00:45 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: document KBUILD_SHELL
References: <1402368710-31648-1-git-send-email-yamada.m@jp.panasonic.com> <5396CF99.1070309@suse.cz> <20140610095016.GA5528@ravnborg.org>
In-Reply-To: <20140610095016.GA5528@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org

On 2014-06-10 11:50, Sam Ravnborg wrote:
>>
>> The variable is assinged with a ":=", not a "?=", so you can't change it
>> from outside, can you?
> 
> Variables assigned with ":=" can be changed like this:
> 
> $ cat Makefile
> FOO := fisk
> $(info FOO=$(FOO))
> all:
> 	@:
> 
> $ FOO=bar make
> FOO=fisk
> 
> $ make FOO=bar
> FOO=bar
> 
> 
> The first is the same as using an environment variable.
> The latter is a special make syntax.

I see. But do we want to encourage people to change the value? IMO There
should be some "change this variable only if you know what you are
doing" warning.

Michal
