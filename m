Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35405 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754045AbaI2OsE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Sep 2014 10:48:04 -0400
Message-ID: <5429711C.4060008@suse.cz>
Date: Mon, 29 Sep 2014 16:47:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v7] checkkconfigsymbols.sh: reimplementation in python
References: <1411222524-7850-1-git-send-email-valentinrothberg@gmail.com>	 <1411919729-5800-1-git-send-email-valentinrothberg@gmail.com> <1411986525.6334.32.camel@x220>
In-Reply-To: <1411986525.6334.32.camel@x220>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, akpm@linux-foundation.org, Stefan Hengelein <stefan.hengelein@fau.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014-09-29 12:28, Paul Bolle wrote:
>> +STMT = r"^\s*(?:if|select|depends\s+on)\s+" + EXPR
> 
> Could please make that "depends on"? Yes, it seems the yacc grammar
> accepts any amount of whitespace, but that doesn't make it right to use
> anything other than a single space.

But then lines that violate coding style would not be checked for real
errors.


> (Can the yacc grammar be tweaked to
> see "depends on" as one, well, token?)

I don't think this is a good idea. This is a style issue, why make it a
grammar issue.

Michal
