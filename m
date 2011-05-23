Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59254 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752438Ab1EWLwd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 07:52:33 -0400
Message-ID: <4DDA4A80.7040406@suse.cz>
Date: Mon, 23 May 2011 13:52:32 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: question about kbuild system
References: <BANLkTi=7AiRbsVojWr=7VVS41EyFXaASGw@mail.gmail.com>
In-Reply-To: <BANLkTi=7AiRbsVojWr=7VVS41EyFXaASGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: os user <gnusercn@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 21.5.2011 14:45, os user wrote:
[...]
>   Considering target file `scripts/basic/.fixdep.cmd'.
>    Looking for an implicit rule for `scripts/basic/.fixdep.cmd'.
>    Trying pattern rule with stem `.fixdep.cmd'.
>    Trying implicit prerequisite `scripts/basic/.fixdep.cmd_shipped'.
>    No implicit rule found for `scripts/basic/.fixdep.cmd'.
>    Finished prerequisites of target file `scripts/basic/.fixdep.cmd'.
>   No need to remake target `scripts/basic/.fixdep.cmd'.
> Considering target file `scripts/basic/.docproc.cmd'.
> [...]
>
> I'm just curious where is the definition for<implicit prerequisite
> `scripts/basic/.fixdep.cmd_shipped'>  ?
> Normally Gnu Make will try a lot of internal rules to deal with
> <`scripts/basic/.fixdep.cmd'>, why here Gnu Make stop
> trying internal ruls so quickly?

Internal rules are disabled in kbuild, see the toplevel Makefile:
# Do not:
# o  use make's built-in rules and variables
#    (this increases performance and avoids hard-to-debug behaviour);
# o  print "Entering directory ...";
MAKEFLAGS += -rR --no-print-directory

The rule for _shipped files is in scripts/Makefile.lib

Michal
