Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44747 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713Ab1EWILE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:04 -0400
Received: by iwn34 with SMTP id 34so4551646iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:03 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 00/13] Kbuild: factor parser rules
Date: Mon, 23 May 2011 04:10:26 -0400
Message-Id: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, David Gibson <david@gibson.dropbear.id.au>

Hi,

[ Original RFC and motivation can be found at:
http://marc.info/?l=linux-kbuild&m=130456101131801&w=2 ]

I tried to re-think the order in this serie to address Michal comments.

Main changes since v1 are:
 - include scripts/dtc/' parser in the scope of the patchset
 - do not rename any parser source
 - make lexer file name consistent, ie. name it %.lex.c, not lex.%.c
 - rebase on top of v2.6.39

A few notes:
 - the parser should not include the lexer; however, this has the advantage to
   avoid having to deals with the parser's header.
 - the tuple ( "migrate parser to implicit rules", regen parser) should really
   be one commit, to enforce bisect'ability

Comments welcome!
 - Arnaud

Cc: David Gibson <david@gibson.dropbear.id.au>

Arnaud Lacombe (13):
  kbuild: add implicit rules for parser generation
  genksyms: include the lexer from the parser
  genksyms: pass hash and lookup functions name and target language
    though the input file
  genksyms: migrate parser to implicit rules
  genksym: regen parser
  kconfig: constify `kconf_id_lookup'
  kconfig: back-out parser prefix, from `zconf' to `yy'
  kconfig: kill no longer needed reference to YYDEBUG
  kconfig: migrate parser to implicit rules
  kconfig: regen parser
  dtc: include the lexer from the parser
  dtc: migrate parser to implicit rules
  dtc: regen parser

 scripts/Makefile.lib                               |   33 ++-
 scripts/dtc/Makefile                               |   29 +--
 scripts/dtc/dtc-lexer.l                            |    1 -
 scripts/dtc/dtc-lexer.lex.c_shipped                |   60 +---
 scripts/dtc/dtc-parser.tab.c_shipped               |  118 +----
 scripts/dtc/dtc-parser.tab.h_shipped               |   91 ----
 scripts/dtc/dtc-parser.y                           |    2 +
 scripts/genksyms/.gitignore                        |    6 +-
 scripts/genksyms/Makefile                          |   48 +--
 scripts/genksyms/keywords.gperf                    |    3 +
 ...{keywords.c_shipped => keywords.hash.c_shipped} |   96 ++--
 scripts/genksyms/lex.l                             |    5 +-
 .../genksyms/{lex.c_shipped => lex.lex.c_shipped}  |  360 +--------------
 scripts/genksyms/parse.h_shipped                   |   97 ----
 .../{parse.c_shipped => parse.tab.c_shipped}       |  200 +-------
 scripts/genksyms/parse.y                           |    2 +
 scripts/kconfig/.gitignore                         |    2 +-
 scripts/kconfig/Makefile                           |   31 +--
 scripts/kconfig/lkc.h                              |    4 +-
 scripts/kconfig/zconf.gperf                        |    2 +-
 scripts/kconfig/zconf.hash.c_shipped               |  273 +++++++-----
 scripts/kconfig/zconf.l                            |   20 +-
 .../{lex.zconf.c_shipped => zconf.lex.c_shipped}   |  493 +++++++++-----------
 scripts/kconfig/zconf.tab.c_shipped                |  102 ++---
 scripts/kconfig/zconf.y                            |   44 +-
 25 files changed, 614 insertions(+), 1508 deletions(-)
 delete mode 100644 scripts/dtc/dtc-parser.tab.h_shipped
 rename scripts/genksyms/{keywords.c_shipped => keywords.hash.c_shipped} (94%)
 rename scripts/genksyms/{lex.c_shipped => lex.lex.c_shipped} (89%)
 delete mode 100644 scripts/genksyms/parse.h_shipped
 rename scripts/genksyms/{parse.c_shipped => parse.tab.c_shipped} (92%)
 rename scripts/kconfig/{lex.zconf.c_shipped => zconf.lex.c_shipped} (81%)

-- 
1.7.3.4.574.g608b.dirty

