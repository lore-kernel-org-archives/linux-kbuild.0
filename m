Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52965 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752356Ab1CIV4N (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Mar 2011 16:56:13 -0500
Message-ID: <4D77F783.60902@suse.cz>
Date: Wed, 09 Mar 2011 22:56:19 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Minimal kernel config generator based on Kconfig language
References: <AANLkTinBrt-fr_e61thAqLO-MN90BA6a28Lain8u__sR@mail.gmail.com>
In-Reply-To: <AANLkTinBrt-fr_e61thAqLO-MN90BA6a28Lain8u__sR@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Filip Honckiewicz <f.honckiewicz@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 1.3.2011 01:49, Filip Honckiewicz wrote:
> Hi!
> 
> I am working on automatic kernel configurator (which is part of my
> thesis) written in python, that will provide config as minimal as
> possible. First stage of the project is to take loaded module names of
> running kernel and add theirs config options to some created
> previously config file (I use for testing make allnoconfig).

How does it compare to the perl-based make localmodconfig?


> My questions:
> 1. How dependencies impacts on possible values of config? Can I set
> “m” value for config option if dependency expression returns “y” or
> can I set “y” if dependency expression returns “m”?

"depends on m" sets the upper limit to m (and y is > m).


> 2. How config value impacts on value of selects? For example can I set
> “y” for selects if config option has “m” value?

No.


> What will change if we
> add “if” clause in select?

The select will only apply if the if expression evaluates to non-zero.


> 3. Use case: I use make allnoconfig to generate initial config and my
> “tool” to enable DRM_CONFIG what results enabling also some
> dependencies and select options too what looks ok when I analyze it
> using pen and sheet of paper. So why, when I use make allnoconfig and
> then enable proper option using make menuconfig it also enables dozen
> of another? Where is the connection?

Hard to tell with such vague problem description. What differences do
you see and why you think your tool is right and menuconfig is wrong at
selecting some options?

Michal
