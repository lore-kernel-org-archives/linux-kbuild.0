Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36659 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753674AbbGBUG3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 16:06:29 -0400
Message-ID: <559599C2.6090505@suse.cz>
Date: Thu, 02 Jul 2015 22:06:26 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] kconfig: allow use of relations other than (in)equality
References: <557EDA310200007800084C43@mail.emea.novell.com> <6743206.QpmKW5snMP@tacticalops>
In-Reply-To: <6743206.QpmKW5snMP@tacticalops>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: Jan Beulich <JBeulich@suse.com>, pebolle@tiscali.nl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 2.7.2015 v 15:04 Martin Walch napsal(a):
> Hi,
> 
>> 1: allow use of relations other than (in)equality
> 
> I know it is a bit late for objections. Still, I want to point out that
> this looks to me like a major extension to the language.
> 
> Kconfig is a configuration language, and as far as I can tell it is
> (intentionally) not Turing complete to keep the configuration simple and
> controllable. All relations that have been defined so far check for equality
> (or for being not equal). The new relations "<=", ">=", "<", and ">" add more
> expressiveness, potentially making the language actually more complex and
> reasoning harder.

The patch just adds four new binary operations of the same order as the
existing == and !=, with a the semantics that everybody expects. And the
grammar for kconfig expressions is so simplistic that you cannot even
write things like (A && B) == (C && D). So turing completeness is not a
topic here, neither before nor after this patch.

Michal
