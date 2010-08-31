Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57660 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932076Ab0HaLfD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Aug 2010 07:35:03 -0400
Message-ID: <4C7CE8E5.7000101@suse.cz>
Date: Tue, 31 Aug 2010 13:35:01 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC] kbuild: use getopt_long(), not its _only() variant
References: <1282579284-20102-1-git-send-email-lacombar@gmail.com> <20100831112353.GB18142@sepie.suse.cz> <20100831113040.GA14669@merkur.ravnborg.org>
In-Reply-To: <20100831113040.GA14669@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 31.8.2010 13:30, Sam Ravnborg wrote:
> On Tue, Aug 31, 2010 at 01:23:53PM +0200, Michal Marek wrote:
>> On Mon, Aug 23, 2010 at 12:01:24PM -0400, Arnaud Lacombe wrote:
>>> NetBSD lacks getopt_long_only() whereas getopt_long() works just fine.
>>>
>>> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
...
> Seems I forgot to do so - I had meant to ack this patch.

I haven't pushed it yet, so I did a git commit --amend and added your ACK.

Michal
