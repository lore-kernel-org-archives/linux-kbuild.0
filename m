Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:61408 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab1FISQx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Jun 2011 14:16:53 -0400
Received: by pwi15 with SMTP id 15so863387pwi.19
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jun 2011 11:16:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DF0B812.4090209@suse.cz>
References: <1307479931-10424-1-git-send-email-lacombar@gmail.com>
	<1307509408-2497-1-git-send-email-lacombar@gmail.com>
	<20110608153843.GB4612@sepie.suse.cz>
	<BANLkTingPzEZXbBim4-BmsvZb8SkG++vEw@mail.gmail.com>
	<4DEFDCBB.9090400@suse.cz>
	<BANLkTikrUA6TdFgAQw3ZbjUxaDpyAsADsA@mail.gmail.com>
	<4DF0B812.4090209@suse.cz>
Date: Thu, 9 Jun 2011 14:16:51 -0400
Message-ID: <BANLkTik_GsHPCTwK_h-gcrsRT+7sbsOhLw@mail.gmail.com>
Subject: Re: [RFCv5] Kbuild: factor parser rules
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Thu, Jun 9, 2011 at 8:09 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 8.6.2011 23:10, Arnaud Lacombe wrote:
>>
>> @#$... I should stop sending stuff at 1 a.m. This is now fixed. New
>> head is c51572047d18641be2350d188f9493f6a39f6b26.
>>
>> Btw, as a small remainder, none of the patch are Signed-off. When
>> you'll be happy with the branch, I'll post the serie for final review.
>
> Thanks, this looks perfect now, please add your signoffs and push once more.
>
Done,

The following changes since commit 55922c9d1b84b89cb946c777fddccb3247e7df2c:

  Linux 3.0-rc1 (2011-05-29 17:43:36 -0700)

are available in the git repository at:
  git@github.com:lacombar/linux-2.6.git kbuild-implicit-parser-rule

Arnaud Lacombe (14):
      kbuild: add `baseprereq'
      kbuild: add implicit rules for parser generation
      kbuild: simplify the %_shipped rule
      genksyms: pass hash and lookup functions name and target
language though the input file
      genksyms: drop -Wno-uninitialized from HOSTCFLAGS_parse.tab.o
      genksyms: migrate parser to implicit rules
      genksym: regen parser
      kconfig: constify `kconf_id_lookup'
      kconfig: kill no longer needed reference to YYDEBUG
      kconfig/zconf.l: do not ask to generate backup
      kconfig: migrate parser to implicit rules
      kconfig: regen parser
      dtc: migrate parser to implicit rules
      dtc: regen parser

 scripts/Kbuild.include                             |    4 +
 scripts/Makefile.lib                               |   40 +++-
 scripts/dtc/Makefile                               |   28 +--
 scripts/dtc/dtc-lexer.lex.c_shipped                |   59 +---
 scripts/dtc/dtc-parser.tab.c_shipped               |  116 +------
 scripts/dtc/dtc-parser.tab.h_shipped               |   11 +-
 scripts/genksyms/.gitignore                        |    7 +-
 scripts/genksyms/Makefile                          |   48 +---
 scripts/genksyms/keywords.gperf                    |    3 +
 ...{keywords.c_shipped => keywords.hash.c_shipped} |   96 +++---
 scripts/genksyms/lex.l                             |    4 +-
 .../genksyms/{lex.c_shipped => lex.lex.c_shipped}  |  359 +-------------------
 .../{parse.c_shipped => parse.tab.c_shipped}       |  198 +----------
 .../{parse.h_shipped => parse.tab.h_shipped}       |    7 +-
 scripts/kconfig/.gitignore                         |    2 +-
 scripts/kconfig/Makefile                           |   34 +--
 scripts/kconfig/lkc.h                              |    2 -
 scripts/kconfig/zconf.gperf                        |    2 +-
 scripts/kconfig/zconf.hash.c_shipped               |  273 +++++++++-------
 scripts/kconfig/zconf.l                            |    8 +-
 .../{lex.zconf.c_shipped => zconf.lex.c_shipped}   |   26 +--
 scripts/kconfig/zconf.tab.c_shipped                |   68 ++--
 scripts/kconfig/zconf.y                            |   18 +-
 23 files changed, 370 insertions(+), 1043 deletions(-)
 rename scripts/genksyms/{keywords.c_shipped => keywords.hash.c_shipped} (94%)
 rename scripts/genksyms/{lex.c_shipped => lex.lex.c_shipped} (89%)
 rename scripts/genksyms/{parse.c_shipped => parse.tab.c_shipped} (92%)
 rename scripts/genksyms/{parse.h_shipped => parse.tab.h_shipped} (96%)
 rename scripts/kconfig/{lex.zconf.c_shipped => zconf.lex.c_shipped} (98%)

 - Arnaud
