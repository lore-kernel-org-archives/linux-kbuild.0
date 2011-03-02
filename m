Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from peer.zerties.org ([188.40.33.175]:59396 "EHLO peer.zerties.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755820Ab1CBKP2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2011 05:15:28 -0500
From: Christian Dietrich <stettberger@dokucode.de>
Subject: Re: Minimal kernel config generator based on Kconfig language
References: <AANLkTinBrt-fr_e61thAqLO-MN90BA6a28Lain8u__sR@mail.gmail.com>
Date: Wed, 02 Mar 2011 10:28:41 +0100
In-Reply-To: <AANLkTinBrt-fr_e61thAqLO-MN90BA6a28Lain8u__sR@mail.gmail.com>
	(Filip Honckiewicz's message of "Tue, 1 Mar 2011 01:49:05 +0100")
Message-ID: <86ipw1x452.fsf@peer.zerties.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Filip Honckiewicz <f.honckiewicz@gmail.com>
Cc: linux-kbuild@vger.kernel.org, vamos-dev@lists.informatik.uni-erlangen.de

Hi,

we[1] are working with Kconfig to do static code analysis. We have
created the undertaker[2] tool, which checks if a preprocessor block is
selectable or not. For this process we needed a formal model of Kconfig
in boolean expressions.

Filip Honckiewicz <f.honckiewicz@gmail.com> writes:

> I am working on automatic kernel configurator (which is part of my
> thesis) written in python, that will provide config as minimal as
> possible. First stage of the project is to take loaded module names of
> running kernel and add theirs config options to some created
> previously config file (I use for testing make allnoconfig).

I don't know if you have noticed the satconf project[3]. There they
expand a given subset configuration to a full blown .config, but i don't
know how minimal the resulting configuration really is.

> I created some parser that builds entries tree - holding all entries
> with their attributes like dependencies and references to parents,
> etc. - but in future it could be replaced by Kconfiglib (patched to
> kernel some time ago), because it looks nicer. I also wrote
> lekser/parser which builds expression tree to resolve dependencies.

Thats great. We use a modified menuconfig and dump out the informations
with debugging functions, which isn't that beautiful.

[...]

> But I have problems with Kconfig syntax and understanding all of
> dependencies which are implemented in configuration tools like make
> menuconfig, but described not enought in kconfig-language, so I am
> asking you for help, because I will not jump over some things only by
> myself:(

Perhaps our kconfig->boolean expression tool is interessting for you. It
produces presence conditions of the form, for every generated symbol in
autoconf.h

SYMBOL -> (EXPRESSION)

At the moment we only have support for choices and dependencies in
mainline, but the support for selects and defaults is on the way. We
have also created lots of testcases to make sure our tool is working
correctly, so perhaps it is interessting to you to have a look[4].

> My questions:
> 1. How dependencies impacts on possible values of config? Can I set
> “m” value for config option if dependency expression returns “y” or
> can I set “y” if dependency expression returns “m”?

The result of the dependency is an upper bound. If the dependency
expression evaluates to "m" you can't select the feature as "y". This
makes a lot of sense, when you think about that "y" means static
compiled into the kernel.

> 2. How config value impacts on value of selects? For example can I set
> “y” for selects if config option has “m” value? What will change if we
> add “if” clause in select?

config A
     select B

Here the value of A is the lower bound for values of B. If there is an
if-EXPR after the select EXPR & A is the lower bound.


[...] - For the other two questions I cannot give you an answer, sorry.

> I would be very very very grateful for help and I thought this
> explanation could be very helpful not only for me, but for anyone who
> want to understand kconfig system.

Yeah understanding all the semantics in Kconfig isn't that easy.

[1] http://www4.informatik.uni-erlangen.de/Research/VAMOS/
[2] http://vamos.informatik.uni-erlangen.de/trac/undertaker
[3] https://github.com/vegard/linux-2.6-kconfig-sat
[4] http://vamos.informatik.uni-erlangen.de/trac/undertaker/browser/rsf2model/validation
-- 
(λ x . x x) (λ x . x x) -- See how beautiful the lambda is
No documentation is better than bad documentation
-- Das Ausdrucken dieser Mail wird urheberrechtlich verfolgt.
