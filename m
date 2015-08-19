Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49703 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754256AbbHSPG7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 11:06:59 -0400
Subject: Re: [PATCH v4 0/2] kconfig: warn of unhandled characters in Kconfig
 commands
References: <cover.1436686646.git.andreas.ruprecht@fau.de>
 <20150720085414.GA32583@huvuddator>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D49B90.4060906@suse.cz>
Date: Wed, 19 Aug 2015 17:06:56 +0200
MIME-Version: 1.0
In-Reply-To: <20150720085414.GA32583@huvuddator>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>, Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On 2015-07-20 10:54, Ulf Magnusson wrote:
> On Sun, Jul 12, 2015 at 09:41:49AM +0200, Andreas Ruprecht wrote:
>> This patchset changes the lexer file to emit a warning if any unhandled
>> characters are found in the input. So far, Kconfig options like
>>
>>  +config FOO
>>     bool
>>     [...]
>>
>> (note the wrong '+'!) were parsed without a warning. As simply adding a
>> warning for '.' produces lots of warnings as occasionally '---help---'
>> is used instead of 'help' (and thus '-' is recognized as an unhandled
>> character), we need to handle '---help---' separately.
>>
>> Changes to v1:
>> 	- add '---help---' in zconf.gperf instead of special casing
>> 	  it in zconf.l
>>
>> Changes to v2:
>> 	- Do no constify char parameter to warn_ignored_character
>> 	- Shorten rule definitions for '.'
>>
>> Changes to v3:
>> 	- spaces -> tabs in zconf.gperf
>>
>> Andreas Ruprecht (2):
>>   kconfig: warn of unhandled characters in Kconfig commands
>>   kconfig: Regenerate shipped zconf.{hash,lex}.c files
>>
>>  scripts/kconfig/zconf.gperf          |   1 +
>>  scripts/kconfig/zconf.hash.c_shipped |  58 ++++---
>>  scripts/kconfig/zconf.l              |  20 ++-
>>  scripts/kconfig/zconf.lex.c_shipped  | 325 +++++++++++++++++------------------
>>  4 files changed, 204 insertions(+), 200 deletions(-)
>>
>> -- 
>> 1.9.1
>>
> 
> For what it's worth:
> 
> Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
> Tested-by: Ulf Magnusson <ulfalizer@gmail.com>

Applied to kbuild.git#kconfig.

Michal

